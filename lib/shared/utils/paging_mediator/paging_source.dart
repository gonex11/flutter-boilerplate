import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/shared/utils/paging_mediator/load_type.dart';
import 'package:flutter_boilerplate/shared/utils/paging_mediator/preconditions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/paging_source.freezed.dart';

abstract mixin class PagingSource<Key, Value> {
  const PagingSource();
  Future<LoadResult<Key, Value>> load(LoadParams<Key> params);
}

@freezed
sealed class LoadParams<Key> with _$LoadParams<Key> {
  const factory LoadParams.refresh({
    Key? key,
    required int loadSize,
  }) = Refresh<Key>;

  const factory LoadParams.append({
    required Key key,
    required int loadSize,
  }) = Append<Key>;

  const factory LoadParams.prepend({
    required Key key,
    required int loadSize,
  }) = Prepend<Key>;

  factory LoadParams({
    required LoadType loadType,
    required int loadSize,
    Key? key,
  }) {
    return switch (loadType) {
      LoadType.refresh => Refresh(key: key, loadSize: loadSize),
      LoadType.prepend => Prepend(key: requireNotNull(key), loadSize: loadSize),
      LoadType.append => Append(key: requireNotNull(key), loadSize: loadSize),
    };
  }
}

@freezed
sealed class LoadResult<Key, Value> with _$LoadResult<Key, Value> {
  const factory LoadResult.page({
    required List<Value> items,
    Key? prevKey,
    Key? nextKey,
  }) = LoadResultPage<Key, Value>;

  const factory LoadResult.error([Object? error]) = LoadResultError;
}
