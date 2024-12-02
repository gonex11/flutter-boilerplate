// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../base_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BaseListResponseImpl<T> _$$BaseListResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$BaseListResponseImpl<T>(
      meta: json['meta'] == null
          ? null
          : MetaResponse.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$$BaseListResponseImplToJson<T>(
  _$BaseListResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'meta': instance.meta?.toJson(),
      'data': instance.data.map(toJsonT).toList(),
    };
