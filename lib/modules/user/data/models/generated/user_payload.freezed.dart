// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../user_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserPayload {
  String? get username => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  /// Serializes this UserPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserPayloadCopyWith<UserPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPayloadCopyWith<$Res> {
  factory $UserPayloadCopyWith(
          UserPayload value, $Res Function(UserPayload) then) =
      _$UserPayloadCopyWithImpl<$Res, UserPayload>;
  @useResult
  $Res call(
      {String? username,
      String? firstName,
      String? lastName,
      String? password});
}

/// @nodoc
class _$UserPayloadCopyWithImpl<$Res, $Val extends UserPayload>
    implements $UserPayloadCopyWith<$Res> {
  _$UserPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPayloadImplCopyWith<$Res>
    implements $UserPayloadCopyWith<$Res> {
  factory _$$UserPayloadImplCopyWith(
          _$UserPayloadImpl value, $Res Function(_$UserPayloadImpl) then) =
      __$$UserPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? username,
      String? firstName,
      String? lastName,
      String? password});
}

/// @nodoc
class __$$UserPayloadImplCopyWithImpl<$Res>
    extends _$UserPayloadCopyWithImpl<$Res, _$UserPayloadImpl>
    implements _$$UserPayloadImplCopyWith<$Res> {
  __$$UserPayloadImplCopyWithImpl(
      _$UserPayloadImpl _value, $Res Function(_$UserPayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? password = freezed,
  }) {
    return _then(_$UserPayloadImpl(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$UserPayloadImpl implements _UserPayload {
  const _$UserPayloadImpl(
      {this.username, this.firstName, this.lastName, this.password});

  @override
  final String? username;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? password;

  @override
  String toString() {
    return 'UserPayload(username: $username, firstName: $firstName, lastName: $lastName, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPayloadImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, username, firstName, lastName, password);

  /// Create a copy of UserPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPayloadImplCopyWith<_$UserPayloadImpl> get copyWith =>
      __$$UserPayloadImplCopyWithImpl<_$UserPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPayloadImplToJson(
      this,
    );
  }
}

abstract class _UserPayload implements UserPayload {
  const factory _UserPayload(
      {final String? username,
      final String? firstName,
      final String? lastName,
      final String? password}) = _$UserPayloadImpl;

  @override
  String? get username;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get password;

  /// Create a copy of UserPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserPayloadImplCopyWith<_$UserPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
