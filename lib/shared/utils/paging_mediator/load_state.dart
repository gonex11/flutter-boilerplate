import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/load_state.freezed.dart';

@freezed
sealed class LoadState with _$LoadState {
  const factory LoadState.notLoading({
    required bool endOfPaginationReached,
  }) = NotLoading;

  const factory LoadState.loading() = Loading;
  const factory LoadState.error([Object? error]) = Error;

  static const notLoadingComplete = NotLoading(endOfPaginationReached: true);
  static const notLoadingIncomplete = NotLoading(endOfPaginationReached: false);
}
