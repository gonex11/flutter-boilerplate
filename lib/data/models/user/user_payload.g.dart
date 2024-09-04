// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPayload _$UserPayloadFromJson(Map<String, dynamic> json) => UserPayload(
      username: json['username'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UserPayloadToJson(UserPayload instance) =>
    <String, dynamic>{
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'password': instance.password,
    };
