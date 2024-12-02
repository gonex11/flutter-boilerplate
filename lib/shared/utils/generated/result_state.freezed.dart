// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResultState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(BaseErrorResponse? error) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(BaseErrorResponse? error)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(BaseErrorResponse? error)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResultInitial<T> value) initial,
    required TResult Function(ResultLoading<T> value) loading,
    required TResult Function(ResultSuccess<T> value) success,
    required TResult Function(ResultFailed<T> value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResultInitial<T> value)? initial,
    TResult? Function(ResultLoading<T> value)? loading,
    TResult? Function(ResultSuccess<T> value)? success,
    TResult? Function(ResultFailed<T> value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResultInitial<T> value)? initial,
    TResult Function(ResultLoading<T> value)? loading,
    TResult Function(ResultSuccess<T> value)? success,
    TResult Function(ResultFailed<T> value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultStateCopyWith<T, $Res> {
  factory $ResultStateCopyWith(
          ResultState<T> value, $Res Function(ResultState<T>) then) =
      _$ResultStateCopyWithImpl<T, $Res, ResultState<T>>;
}

/// @nodoc
class _$ResultStateCopyWithImpl<T, $Res, $Val extends ResultState<T>>
    implements $ResultStateCopyWith<T, $Res> {
  _$ResultStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ResultInitialImplCopyWith<T, $Res> {
  factory _$$ResultInitialImplCopyWith(_$ResultInitialImpl<T> value,
          $Res Function(_$ResultInitialImpl<T>) then) =
      __$$ResultInitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ResultInitialImplCopyWithImpl<T, $Res>
    extends _$ResultStateCopyWithImpl<T, $Res, _$ResultInitialImpl<T>>
    implements _$$ResultInitialImplCopyWith<T, $Res> {
  __$$ResultInitialImplCopyWithImpl(_$ResultInitialImpl<T> _value,
      $Res Function(_$ResultInitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ResultState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResultInitialImpl<T> implements ResultInitial<T> {
  const _$ResultInitialImpl();

  @override
  String toString() {
    return 'ResultState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResultInitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(BaseErrorResponse? error) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(BaseErrorResponse? error)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(BaseErrorResponse? error)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResultInitial<T> value) initial,
    required TResult Function(ResultLoading<T> value) loading,
    required TResult Function(ResultSuccess<T> value) success,
    required TResult Function(ResultFailed<T> value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResultInitial<T> value)? initial,
    TResult? Function(ResultLoading<T> value)? loading,
    TResult? Function(ResultSuccess<T> value)? success,
    TResult? Function(ResultFailed<T> value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResultInitial<T> value)? initial,
    TResult Function(ResultLoading<T> value)? loading,
    TResult Function(ResultSuccess<T> value)? success,
    TResult Function(ResultFailed<T> value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ResultInitial<T> implements ResultState<T> {
  const factory ResultInitial() = _$ResultInitialImpl<T>;
}

/// @nodoc
abstract class _$$ResultLoadingImplCopyWith<T, $Res> {
  factory _$$ResultLoadingImplCopyWith(_$ResultLoadingImpl<T> value,
          $Res Function(_$ResultLoadingImpl<T>) then) =
      __$$ResultLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ResultLoadingImplCopyWithImpl<T, $Res>
    extends _$ResultStateCopyWithImpl<T, $Res, _$ResultLoadingImpl<T>>
    implements _$$ResultLoadingImplCopyWith<T, $Res> {
  __$$ResultLoadingImplCopyWithImpl(_$ResultLoadingImpl<T> _value,
      $Res Function(_$ResultLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ResultState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResultLoadingImpl<T> implements ResultLoading<T> {
  const _$ResultLoadingImpl();

  @override
  String toString() {
    return 'ResultState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResultLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(BaseErrorResponse? error) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(BaseErrorResponse? error)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(BaseErrorResponse? error)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResultInitial<T> value) initial,
    required TResult Function(ResultLoading<T> value) loading,
    required TResult Function(ResultSuccess<T> value) success,
    required TResult Function(ResultFailed<T> value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResultInitial<T> value)? initial,
    TResult? Function(ResultLoading<T> value)? loading,
    TResult? Function(ResultSuccess<T> value)? success,
    TResult? Function(ResultFailed<T> value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResultInitial<T> value)? initial,
    TResult Function(ResultLoading<T> value)? loading,
    TResult Function(ResultSuccess<T> value)? success,
    TResult Function(ResultFailed<T> value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ResultLoading<T> implements ResultState<T> {
  const factory ResultLoading() = _$ResultLoadingImpl<T>;
}

/// @nodoc
abstract class _$$ResultSuccessImplCopyWith<T, $Res> {
  factory _$$ResultSuccessImplCopyWith(_$ResultSuccessImpl<T> value,
          $Res Function(_$ResultSuccessImpl<T>) then) =
      __$$ResultSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$ResultSuccessImplCopyWithImpl<T, $Res>
    extends _$ResultStateCopyWithImpl<T, $Res, _$ResultSuccessImpl<T>>
    implements _$$ResultSuccessImplCopyWith<T, $Res> {
  __$$ResultSuccessImplCopyWithImpl(_$ResultSuccessImpl<T> _value,
      $Res Function(_$ResultSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ResultState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ResultSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ResultSuccessImpl<T> implements ResultSuccess<T> {
  const _$ResultSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'ResultState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of ResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultSuccessImplCopyWith<T, _$ResultSuccessImpl<T>> get copyWith =>
      __$$ResultSuccessImplCopyWithImpl<T, _$ResultSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(BaseErrorResponse? error) failed,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(BaseErrorResponse? error)? failed,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(BaseErrorResponse? error)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResultInitial<T> value) initial,
    required TResult Function(ResultLoading<T> value) loading,
    required TResult Function(ResultSuccess<T> value) success,
    required TResult Function(ResultFailed<T> value) failed,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResultInitial<T> value)? initial,
    TResult? Function(ResultLoading<T> value)? loading,
    TResult? Function(ResultSuccess<T> value)? success,
    TResult? Function(ResultFailed<T> value)? failed,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResultInitial<T> value)? initial,
    TResult Function(ResultLoading<T> value)? loading,
    TResult Function(ResultSuccess<T> value)? success,
    TResult Function(ResultFailed<T> value)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ResultSuccess<T> implements ResultState<T> {
  const factory ResultSuccess(final T data) = _$ResultSuccessImpl<T>;

  T get data;

  /// Create a copy of ResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultSuccessImplCopyWith<T, _$ResultSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResultFailedImplCopyWith<T, $Res> {
  factory _$$ResultFailedImplCopyWith(_$ResultFailedImpl<T> value,
          $Res Function(_$ResultFailedImpl<T>) then) =
      __$$ResultFailedImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({BaseErrorResponse? error});

  $BaseErrorResponseCopyWith<$Res>? get error;
}

/// @nodoc
class __$$ResultFailedImplCopyWithImpl<T, $Res>
    extends _$ResultStateCopyWithImpl<T, $Res, _$ResultFailedImpl<T>>
    implements _$$ResultFailedImplCopyWith<T, $Res> {
  __$$ResultFailedImplCopyWithImpl(
      _$ResultFailedImpl<T> _value, $Res Function(_$ResultFailedImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ResultState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$ResultFailedImpl<T>(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseErrorResponse?,
    ));
  }

  /// Create a copy of ResultState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BaseErrorResponseCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $BaseErrorResponseCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$ResultFailedImpl<T> implements ResultFailed<T> {
  const _$ResultFailedImpl([this.error]);

  @override
  final BaseErrorResponse? error;

  @override
  String toString() {
    return 'ResultState<$T>.failed(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultFailedImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of ResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultFailedImplCopyWith<T, _$ResultFailedImpl<T>> get copyWith =>
      __$$ResultFailedImplCopyWithImpl<T, _$ResultFailedImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(BaseErrorResponse? error) failed,
  }) {
    return failed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(BaseErrorResponse? error)? failed,
  }) {
    return failed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(BaseErrorResponse? error)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResultInitial<T> value) initial,
    required TResult Function(ResultLoading<T> value) loading,
    required TResult Function(ResultSuccess<T> value) success,
    required TResult Function(ResultFailed<T> value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResultInitial<T> value)? initial,
    TResult? Function(ResultLoading<T> value)? loading,
    TResult? Function(ResultSuccess<T> value)? success,
    TResult? Function(ResultFailed<T> value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResultInitial<T> value)? initial,
    TResult Function(ResultLoading<T> value)? loading,
    TResult Function(ResultSuccess<T> value)? success,
    TResult Function(ResultFailed<T> value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class ResultFailed<T> implements ResultState<T> {
  const factory ResultFailed([final BaseErrorResponse? error]) =
      _$ResultFailedImpl<T>;

  BaseErrorResponse? get error;

  /// Create a copy of ResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultFailedImplCopyWith<T, _$ResultFailedImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
