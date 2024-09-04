// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseErrorResponse _$BaseErrorResponseFromJson(Map<String, dynamic> json) =>
    BaseErrorResponse(
      type: json['type'] as String?,
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => ErrorDetailResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BaseErrorResponseToJson(BaseErrorResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'errors': instance.errors?.map((e) => e.toJson()).toList(),
    };
