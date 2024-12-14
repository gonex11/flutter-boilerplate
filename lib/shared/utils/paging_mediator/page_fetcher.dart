import 'package:cancellation_token/cancellation_token.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/shared/utils/paging_mediator/load_state.dart';
import 'package:flutter_boilerplate/shared/utils/paging_mediator/load_type.dart';
import 'package:flutter_boilerplate/shared/utils/paging_mediator/paging_config.dart';
import 'package:flutter_boilerplate/shared/utils/paging_mediator/paging_source.dart';
import 'package:flutter_boilerplate/shared/utils/paging_mediator/paging_state.dart';

class PageFetcher<Key, Value> extends ValueNotifier<PagingState<Key, Value>> {
  PageFetcher({
    this.initialKey,
    required this.config,
    required this.pagingSource,
    required PagingState<Key, Value> initialState,
  }) : super(initialState);

  final Key? initialKey;
  final PagingConfig config;
  final PagingSource<Key, Value> pagingSource;

  final _cancellationToken = CancellationToken();

  @override
  void dispose() {
    _cancellationToken.cancel();
    return super.dispose();
  }

  Future<void> load(LoadType loadType) {
    return switch (loadType) {
      LoadType.refresh => _doInitialLoad(),
      LoadType.append || LoadType.prepend => _doLoad(loadType),
    };
  }

  Future<void> retry() async {
    for (final loadType in LoadType.values) {
      final loadState = value.getLoadState(loadType);
      if (loadState is! Error) continue;

      value = value.setLoading(loadType);

      load(loadType);
    }
  }

  LoadParams<Key> _loadParams(LoadType loadType, Key? key) {
    return LoadParams(
      loadType: loadType,
      key: key,
      loadSize: switch (loadType) {
        LoadType.refresh => config.initialLoadSize,
        _ => config.pageSize,
      },
    );
  }

  Future<void> _doInitialLoad() {
    return _withCancellationScope(
      token: _cancellationToken,
      () async {
        if (value.getLoadState(LoadType.refresh) case Loading()) return;
        value = value.setLoading(LoadType.refresh);

        final params = _loadParams(LoadType.refresh, initialKey);
        final result = await _withCancellationScope(
          token: _cancellationToken,
          () => pagingSource.load(params),
        );

        if (result == null) return;

        result.map(
          page: (page) {
            value = value.insertPage(LoadType.refresh, page);
          },
          error: (it) {
            value = value.setError(LoadType.refresh, it.error);
          },
        );
      },
    );
  }

  Future<void> _doLoad(LoadType loadType) {
    return _withCancellationScope(
      token: _cancellationToken,
      () async {
        assert(
          loadType != LoadType.refresh,
          'Use doInitialLoad for LoadType == refresh',
        );

        if (value.getLoadState(loadType) case Loading()) return;

        final loadKey = _nextLoadKeyOrNull(loadType);
        if (loadKey == null) return;

        value = value.setLoading(loadType);

        final params = _loadParams(loadType, loadKey);
        final result = await _withCancellationScope(
          token: _cancellationToken,
          () => pagingSource.load(params),
        );

        if (result == null) return;

        result.map(
          page: (page) {
            final nextKey = switch (loadType) {
              LoadType.prepend => page.prevKey,
              LoadType.append => page.nextKey,
              _ => throw ArgumentError(
                  'Use doInitialLoad for LoadType == refresh'),
            };

            if (nextKey == loadKey) {
              throw StateError(
                '''The same value, $loadKey, was passed as the ${loadType == LoadType.prepend ? 'prevKey' : 'nextKey'} 
            in two sequential Pages loaded from a PagingSource. Re-using load keys in PagingSource is often an error''',
              );
            }

            value = value.insertPage(loadType, page);
          },
          error: (it) {
            value = value.setError(loadType, it.error);
          },
        );

        final dropType = switch (loadType) {
          LoadType.prepend => LoadType.append,
          _ => LoadType.prepend,
        };

        final pagesToDropCount = _pagesToDropCount(dropType);
        if (pagesToDropCount <= 0) return;

        value = value.dropPages(dropType, pageCount: pagesToDropCount);
      },
    );
  }

  int _pagesToDropCount(LoadType loadType) {
    final maxSize = config.maxSize;
    if (maxSize == null) return 0;

    if (value.pages.length <= 3) return 0;

    if (value.pages.itemCount <= maxSize) return 0;

    if (loadType == LoadType.refresh) {
      throw ArgumentError(
        'LoadType must be Prepend or Append, but got $loadType',
      );
    }

    var pagesToDrop = 0;
    var itemsToDrop = 0;
    while (pagesToDrop < value.pages.length &&
        value.pages.itemCount - itemsToDrop > maxSize) {
      final pages = value.pages;

      final pageSize = switch (loadType) {
        LoadType.prepend => pages[pagesToDrop].items.length,
        _ => pages[(pages.length - 1) - pagesToDrop].items.length,
      };

      itemsToDrop += pageSize;
      pagesToDrop++;
    }

    return pagesToDrop;
  }

  Key? _nextLoadKeyOrNull(LoadType loadType) {
    return switch (loadType) {
      LoadType.prepend => _nextPrependKey,
      LoadType.append => _nextAppendKey,
      LoadType.refresh => throw ArgumentError('Just use initialKey directly'),
    };
  }

  Key? get _nextPrependKey {
    final currentValue = value;
    if (currentValue.pages.isEmpty) return null;
    if (currentValue.prependLoadState is Error) return null;

    return currentValue.pages.first.prevKey;
  }

  Key? get _nextAppendKey {
    final currentValue = value;
    if (currentValue.pages.isEmpty) return null;
    if (currentValue.appendLoadState is Error) return null;

    return currentValue.pages.last.nextKey;
  }

  Future<T?> _withCancellationScope<T>(
    Future<T> Function() callback, {
    required CancellationToken token,
    void Function(Object, StackTrace)? onCancelled,
  }) async {
    final currentState = value;

    try {
      return await CancellableFuture.from(callback, token);
    } on CancelledException catch (e, stk) {
      value = currentState;

      if (onCancelled != null) onCancelled(e, stk);

      return null;
    }
  }
}

extension<Key, Value> on PagingState<Key, Value> {
  LoadState getLoadState(LoadType loadType) {
    return switch (loadType) {
      LoadType.refresh => refreshLoadState,
      LoadType.prepend => prependLoadState,
      LoadType.append => appendLoadState,
    };
  }

  PagingState<Key, Value> insertPage(
    LoadType loadType,
    LoadResultPage<Key, Value> page,
  ) {
    switch (loadType) {
      case LoadType.refresh:
        return PagingState(
          pages: PagingList(bottom: [page]),
          refreshLoadState: LoadState.notLoadingComplete,
          prependLoadState: LoadState.notLoading(
            endOfPaginationReached: page.prevKey == null,
          ),
          appendLoadState: LoadState.notLoading(
            endOfPaginationReached: page.nextKey == null,
          ),
        );
      case LoadType.prepend:
        if (pages.isEmpty) {
          throw StateError('should\'ve received an init before prepend');
        }

        return copyWith(
          pages: PagingList(
            top: [page, ...pages.top],
            bottom: pages.bottom,
          ),
          prependLoadState: LoadState.notLoading(
            endOfPaginationReached: page.prevKey == null,
          ),
        );
      case LoadType.append:
        if (pages.isEmpty) {
          throw StateError('should\'ve received an init before append');
        }

        return copyWith(
          pages: PagingList(
            top: pages.top,
            bottom: [...pages.bottom, page],
          ),
          appendLoadState: LoadState.notLoading(
            endOfPaginationReached: page.nextKey == null,
          ),
        );
    }
  }

  PagingState<Key, Value> dropPages(
    LoadType dropType, {
    required int pageCount,
  }) {
    if (pageCount >= pages.length) {
      throw ArgumentError(
        'invalid drop count. have ${pages.length} but wanted to drop $pageCount',
      );
    }

    switch (dropType) {
      case LoadType.prepend:
        {
          final topPageCount = pages.top.length;
          if (pageCount <= topPageCount) {
            return copyWith(
              pages: PagingList(
                top: pages.top.sublist(pageCount),
                bottom: pages.bottom,
              ),
              prependLoadState: LoadState.notLoadingIncomplete,
            );
          }

          return copyWith(
            pages: PagingList(
              top: const [],
              bottom: pages.bottom.sublist(pageCount - topPageCount),
            ),
            prependLoadState: LoadState.notLoadingIncomplete,
          );
        }
      case LoadType.append:
        {
          final bottomPageCount = pages.bottom.length;
          if (pageCount <= bottomPageCount) {
            return copyWith(
              pages: PagingList(
                top: pages.top,
                bottom: pages.bottom.sublist(0, bottomPageCount - pageCount),
              ),
              appendLoadState: LoadState.notLoadingIncomplete,
            );
          }

          final topPageCount = pages.top.length;
          return copyWith(
            pages: PagingList(
              top: pages.top.sublist(
                0,
                topPageCount - (pageCount - bottomPageCount),
              ),
              bottom: const [],
            ),
            appendLoadState: LoadState.notLoadingIncomplete,
          );
        }
      case _:
        throw ArgumentError('invalid drop type: $dropType');
    }
  }

  PagingState<Key, Value> setLoading(LoadType loadType) {
    return switch (loadType) {
      LoadType.refresh => copyWith(refreshLoadState: const LoadState.loading()),
      LoadType.prepend => copyWith(prependLoadState: const LoadState.loading()),
      LoadType.append => copyWith(appendLoadState: const LoadState.loading()),
    };
  }

  PagingState<Key, Value> setError(LoadType loadType, [Object? error]) {
    return switch (loadType) {
      LoadType.refresh => copyWith(refreshLoadState: LoadState.error(error)),
      LoadType.prepend => copyWith(prependLoadState: LoadState.error(error)),
      LoadType.append => copyWith(appendLoadState: LoadState.error(error)),
    };
  }
}
