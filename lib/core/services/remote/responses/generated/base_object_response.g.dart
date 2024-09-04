// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../base_object_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseObjectResponse<T> _$BaseObjectResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseObjectResponse<T>(
      data: fromJsonT(json['data']),
    );

Map<String, dynamic> _$BaseObjectResponseToJson<T>(
  BaseObjectResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
    };
