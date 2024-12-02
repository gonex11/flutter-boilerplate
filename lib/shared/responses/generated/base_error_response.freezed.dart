// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../base_error_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BaseErrorResponse _$BaseErrorResponseFromJson(Map<String, dynamic> json) {
  return _BaseErrorResponse.fromJson(json);
}

/// @nodoc
mixin _$BaseErrorResponse {
  String? get type => throw _privateConstructorUsedError;
  List<ErrorDetailResponse>? get errors => throw _privateConstructorUsedError;

  /// Serializes this BaseErrorResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BaseErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BaseErrorResponseCopyWith<BaseErrorResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseErrorResponseCopyWith<$Res> {
  factory $BaseErrorResponseCopyWith(
          BaseErrorResponse value, $Res Function(BaseErrorResponse) then) =
      _$BaseErrorResponseCopyWithImpl<$Res, BaseErrorResponse>;
  @useResult
  $Res call({String? type, List<ErrorDetailResponse>? errors});
}

/// @nodoc
class _$BaseErrorResponseCopyWithImpl<$Res, $Val extends BaseErrorResponse>
    implements $BaseErrorResponseCopyWith<$Res> {
  _$BaseErrorResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BaseErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? errors = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      errors: freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ErrorDetailResponse>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaseErrorResponseImplCopyWith<$Res>
    implements $BaseErrorResponseCopyWith<$Res> {
  factory _$$BaseErrorResponseImplCopyWith(_$BaseErrorResponseImpl value,
          $Res Function(_$BaseErrorResponseImpl) then) =
      __$$BaseErrorResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? type, List<ErrorDetailResponse>? errors});
}

/// @nodoc
class __$$BaseErrorResponseImplCopyWithImpl<$Res>
    extends _$BaseErrorResponseCopyWithImpl<$Res, _$BaseErrorResponseImpl>
    implements _$$BaseErrorResponseImplCopyWith<$Res> {
  __$$BaseErrorResponseImplCopyWithImpl(_$BaseErrorResponseImpl _value,
      $Res Function(_$BaseErrorResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of BaseErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? errors = freezed,
  }) {
    return _then(_$BaseErrorResponseImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      errors: freezed == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ErrorDetailResponse>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BaseErrorResponseImpl implements _BaseErrorResponse {
  const _$BaseErrorResponseImpl(
      {this.type, final List<ErrorDetailResponse>? errors})
      : _errors = errors;

  factory _$BaseErrorResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BaseErrorResponseImplFromJson(json);

  @override
  final String? type;
  final List<ErrorDetailResponse>? _errors;
  @override
  List<ErrorDetailResponse>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BaseErrorResponse(type: $type, errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseErrorResponseImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(_errors));

  /// Create a copy of BaseErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseErrorResponseImplCopyWith<_$BaseErrorResponseImpl> get copyWith =>
      __$$BaseErrorResponseImplCopyWithImpl<_$BaseErrorResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BaseErrorResponseImplToJson(
      this,
    );
  }
}

abstract class _BaseErrorResponse implements BaseErrorResponse {
  const factory _BaseErrorResponse(
      {final String? type,
      final List<ErrorDetailResponse>? errors}) = _$BaseErrorResponseImpl;

  factory _BaseErrorResponse.fromJson(Map<String, dynamic> json) =
      _$BaseErrorResponseImpl.fromJson;

  @override
  String? get type;
  @override
  List<ErrorDetailResponse>? get errors;

  /// Create a copy of BaseErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BaseErrorResponseImplCopyWith<_$BaseErrorResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
