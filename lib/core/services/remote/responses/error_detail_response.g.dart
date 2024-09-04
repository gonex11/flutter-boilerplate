// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorDetailResponse _$ErrorDetailResponseFromJson(Map<String, dynamic> json) =>
    ErrorDetailResponse(
      code: json['code'] as String,
      detail: json['detail'] as String,
      attr: json['attr'] as String?,
    );

Map<String, dynamic> _$ErrorDetailResponseToJson(
        ErrorDetailResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'detail': instance.detail,
      'attr': instance.attr,
    };
