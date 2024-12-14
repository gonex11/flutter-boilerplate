import 'package:collection/collection.dart';
import 'package:flutter_boilerplate/shared/utils/paging_mediator/load_state.dart';
import 'package:flutter_boilerplate/shared/utils/paging_mediator/paging_source.dart';
import 'package:flutter_boilerplate/shared/utils/paging_mediator/two_part_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/paging_state.freezed.dart';

typedef PagingList<E> = TwoPartList<E>;

@freezed
sealed class PagingState<Key, Value> with _$PagingState<Key, Value> {
  const factory PagingState({
    @Default(PagingList()) PagingList<LoadResultPage<Key, Value>> pages,
    @Default(LoadState.notLoadingIncomplete) LoadState refreshLoadState,
    @Default(LoadState.notLoadingIncomplete) LoadState prependLoadState,
    @Default(LoadState.notLoadingIncomplete) LoadState appendLoadState,
  }) = _PagingState<Key, Value>;

  factory PagingState.fromPages(List<LoadResultPage<Key, Value>> pages) {
    if (pages.isEmpty) return const PagingState();

    return PagingState(
      pages: PagingList(bottom: pages),
      refreshLoadState: LoadState.notLoadingComplete,
      prependLoadState: LoadState.notLoading(
        endOfPaginationReached: pages.first.prevKey == null,
      ),
      appendLoadState: LoadState.notLoading(
        endOfPaginationReached: pages.last.nextKey == null,
      ),
    );
  }
}

extension PagingListExtension<Key, Value> on List<LoadResultPage<Key, Value>> {
  Key? get prevKey => firstOrNull?.prevKey;
  Key? get nextKey => lastOrNull?.nextKey;

  Iterable<Value> get items => expand((it) => it.items);

  int get itemCount => fold(0, (acc, it) => acc + it.items.length);

  bool get isListEmpty => isEmpty || every((it) => it.items.isEmpty);

  bool get isListNotEmpty => isNotEmpty && any((it) => it.items.isNotEmpty);

  Value? get firstItemOrNull => firstOrNull?.items.firstOrNull;

  Value? get lastItemOrNull => lastOrNull?.items.lastOrNull;
}
