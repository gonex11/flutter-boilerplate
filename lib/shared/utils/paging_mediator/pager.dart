import 'package:flutter/foundation.dart';

import 'load_state.dart';
import 'load_type.dart';
import 'page_fetcher.dart';
import 'paging_config.dart';
import 'paging_source.dart';
import 'paging_state.dart';

typedef PagingSourceFactory<Key, Value> = PagingSource<Key, Value> Function();

typedef PageFetcherFactory<Key, Value> = PageFetcher<Key, Value> Function(
  Key? initialKey,
  PagingState<Key, Value> initialState,
);

class Pager<Key, Value> implements ValueListenable<PagingState<Key, Value>> {
  Pager({
    Key? initialKey,
    required PagingConfig config,
    PagingState<Key, Value> initialState = const PagingState(),
    required PagingSourceFactory<Key, Value> pagingSourceFactory,
  })  : _notifier = ValueNotifier(initialState),
        _pageFetcherFactory = ((initialKey, initialState) {
          final pageFetcher = PageFetcher<Key, Value>(
            initialKey: initialKey,
            config: config,
            initialState: initialState,
            pagingSource: pagingSourceFactory.call(),
          );

          return pageFetcher;
        }) {
    _pageFetcher = _pageFetcherFactory.call(initialKey, initialState);
    _pageFetcher.addListener(_onPageFetcherStateChange);
  }

  @visibleForTesting
  Pager.custom({
    Key? initialKey,
    PagingState<Key, Value> initialState = const PagingState(),
    required PageFetcherFactory<Key, Value> pageFetcherFactory,
  })  : _notifier = ValueNotifier(initialState),
        _pageFetcherFactory = pageFetcherFactory {
    _pageFetcher = _pageFetcherFactory.call(initialKey, initialState);
    _pageFetcher.addListener(_onPageFetcherStateChange);
  }

  void _onPageFetcherStateChange() {
    _notifier.value = _pageFetcher.value;
  }

  late PageFetcher<Key, Value> _pageFetcher;
  final PageFetcherFactory<Key, Value> _pageFetcherFactory;

  final ValueNotifier<PagingState<Key, Value>> _notifier;

  PagingConfig get config => _pageFetcher.config;

  @override
  PagingState<Key, Value> get value => _notifier.value;

  @override
  void addListener(VoidCallback listener) {
    return _notifier.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    return _notifier.removeListener(listener);
  }

  Future<void> load(LoadType loadType) {
    return _pageFetcher.load(loadType);
  }

  Future<void> retry() => _pageFetcher.retry();

  Future<void> refresh({
    Key? refreshKey,
    bool resetPages = true,
  }) {
    final previousPageFetcher = _pageFetcher;

    previousPageFetcher.removeListener(_onPageFetcherStateChange);
    previousPageFetcher.dispose();

    var initialState =
        PagingState<Key, Value>.fromPages(previousPageFetcher.value.pages);
    if (resetPages) {
      initialState = const PagingState();
    }

    final initialKey = refreshKey ?? previousPageFetcher.initialKey;
    _pageFetcher = _pageFetcherFactory.call(initialKey, initialState);
    _pageFetcher.addListener(_onPageFetcherStateChange);

    return _pageFetcher.load(LoadType.refresh);
  }

  @mustCallSuper
  void dispose() {
    _pageFetcher.removeListener(_onPageFetcherStateChange);
    _pageFetcher.dispose();
    _notifier.dispose();
  }
}

extension PagerExtension<Key, Value> on Pager<Key, Value> {
  Iterable<Value> get items => pages.items;

  PagingList<LoadResultPage<Key, Value>> get pages => value.pages;

  LoadState get refreshLoadState => value.refreshLoadState;

  LoadState get prependLoadState => value.prependLoadState;

  LoadState get appendLoadState => value.appendLoadState;
}
