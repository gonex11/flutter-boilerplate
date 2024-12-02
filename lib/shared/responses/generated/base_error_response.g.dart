// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../base_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BaseErrorResponseImpl _$$BaseErrorResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BaseErrorResponseImpl(
      type: json['type'] as String?,
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => ErrorDetailResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BaseErrorResponseImplToJson(
        _$BaseErrorResponseImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'errors': instance.errors?.map((e) => e.toJson()).toList(),
    };
