// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../error_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ErrorDetailResponse _$ErrorDetailResponseFromJson(Map<String, dynamic> json) {
  return _ErrorDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$ErrorDetailResponse {
  String get code => throw _privateConstructorUsedError;
  String get detail => throw _privateConstructorUsedError;
  String? get attr => throw _privateConstructorUsedError;

  /// Serializes this ErrorDetailResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ErrorDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ErrorDetailResponseCopyWith<ErrorDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorDetailResponseCopyWith<$Res> {
  factory $ErrorDetailResponseCopyWith(
          ErrorDetailResponse value, $Res Function(ErrorDetailResponse) then) =
      _$ErrorDetailResponseCopyWithImpl<$Res, ErrorDetailResponse>;
  @useResult
  $Res call({String code, String detail, String? attr});
}

/// @nodoc
class _$ErrorDetailResponseCopyWithImpl<$Res, $Val extends ErrorDetailResponse>
    implements $ErrorDetailResponseCopyWith<$Res> {
  _$ErrorDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ErrorDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? detail = null,
    Object? attr = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      attr: freezed == attr
          ? _value.attr
          : attr // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ErrorDetailResponseImplCopyWith<$Res>
    implements $ErrorDetailResponseCopyWith<$Res> {
  factory _$$ErrorDetailResponseImplCopyWith(_$ErrorDetailResponseImpl value,
          $Res Function(_$ErrorDetailResponseImpl) then) =
      __$$ErrorDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String detail, String? attr});
}

/// @nodoc
class __$$ErrorDetailResponseImplCopyWithImpl<$Res>
    extends _$ErrorDetailResponseCopyWithImpl<$Res, _$ErrorDetailResponseImpl>
    implements _$$ErrorDetailResponseImplCopyWith<$Res> {
  __$$ErrorDetailResponseImplCopyWithImpl(_$ErrorDetailResponseImpl _value,
      $Res Function(_$ErrorDetailResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ErrorDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? detail = null,
    Object? attr = freezed,
  }) {
    return _then(_$ErrorDetailResponseImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      attr: freezed == attr
          ? _value.attr
          : attr // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ErrorDetailResponseImpl implements _ErrorDetailResponse {
  const _$ErrorDetailResponseImpl(
      {required this.code, required this.detail, this.attr});

  factory _$ErrorDetailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ErrorDetailResponseImplFromJson(json);

  @override
  final String code;
  @override
  final String detail;
  @override
  final String? attr;

  @override
  String toString() {
    return 'ErrorDetailResponse(code: $code, detail: $detail, attr: $attr)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorDetailResponseImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.attr, attr) || other.attr == attr));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, detail, attr);

  /// Create a copy of ErrorDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorDetailResponseImplCopyWith<_$ErrorDetailResponseImpl> get copyWith =>
      __$$ErrorDetailResponseImplCopyWithImpl<_$ErrorDetailResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorDetailResponseImplToJson(
      this,
    );
  }
}

abstract class _ErrorDetailResponse implements ErrorDetailResponse {
  const factory _ErrorDetailResponse(
      {required final String code,
      required final String detail,
      final String? attr}) = _$ErrorDetailResponseImpl;

  factory _ErrorDetailResponse.fromJson(Map<String, dynamic> json) =
      _$ErrorDetailResponseImpl.fromJson;

  @override
  String get code;
  @override
  String get detail;
  @override
  String? get attr;

  /// Create a copy of ErrorDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorDetailResponseImplCopyWith<_$ErrorDetailResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
