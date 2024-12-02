// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../base_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BaseListResponse<T> _$BaseListResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _BaseListResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$BaseListResponse<T> {
  MetaResponse? get meta => throw _privateConstructorUsedError;
  List<T> get data => throw _privateConstructorUsedError;

  /// Serializes this BaseListResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of BaseListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BaseListResponseCopyWith<T, BaseListResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseListResponseCopyWith<T, $Res> {
  factory $BaseListResponseCopyWith(
          BaseListResponse<T> value, $Res Function(BaseListResponse<T>) then) =
      _$BaseListResponseCopyWithImpl<T, $Res, BaseListResponse<T>>;
  @useResult
  $Res call({MetaResponse? meta, List<T> data});

  $MetaResponseCopyWith<$Res>? get meta;
}

/// @nodoc
class _$BaseListResponseCopyWithImpl<T, $Res, $Val extends BaseListResponse<T>>
    implements $BaseListResponseCopyWith<T, $Res> {
  _$BaseListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BaseListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as MetaResponse?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }

  /// Create a copy of BaseListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetaResponseCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $MetaResponseCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BaseListResponseImplCopyWith<T, $Res>
    implements $BaseListResponseCopyWith<T, $Res> {
  factory _$$BaseListResponseImplCopyWith(_$BaseListResponseImpl<T> value,
          $Res Function(_$BaseListResponseImpl<T>) then) =
      __$$BaseListResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({MetaResponse? meta, List<T> data});

  @override
  $MetaResponseCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$BaseListResponseImplCopyWithImpl<T, $Res>
    extends _$BaseListResponseCopyWithImpl<T, $Res, _$BaseListResponseImpl<T>>
    implements _$$BaseListResponseImplCopyWith<T, $Res> {
  __$$BaseListResponseImplCopyWithImpl(_$BaseListResponseImpl<T> _value,
      $Res Function(_$BaseListResponseImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of BaseListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = freezed,
    Object? data = null,
  }) {
    return _then(_$BaseListResponseImpl<T>(
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as MetaResponse?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$BaseListResponseImpl<T> implements _BaseListResponse<T> {
  const _$BaseListResponseImpl({this.meta, required final List<T> data})
      : _data = data;

  factory _$BaseListResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$BaseListResponseImplFromJson(json, fromJsonT);

  @override
  final MetaResponse? meta;
  final List<T> _data;
  @override
  List<T> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'BaseListResponse<$T>(meta: $meta, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseListResponseImpl<T> &&
            (identical(other.meta, meta) || other.meta == meta) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, meta, const DeepCollectionEquality().hash(_data));

  /// Create a copy of BaseListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseListResponseImplCopyWith<T, _$BaseListResponseImpl<T>> get copyWith =>
      __$$BaseListResponseImplCopyWithImpl<T, _$BaseListResponseImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$BaseListResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _BaseListResponse<T> implements BaseListResponse<T> {
  const factory _BaseListResponse(
      {final MetaResponse? meta,
      required final List<T> data}) = _$BaseListResponseImpl<T>;

  factory _BaseListResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$BaseListResponseImpl<T>.fromJson;

  @override
  MetaResponse? get meta;
  @override
  List<T> get data;

  /// Create a copy of BaseListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BaseListResponseImplCopyWith<T, _$BaseListResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
