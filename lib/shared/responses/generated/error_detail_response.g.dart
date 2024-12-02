// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../error_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ErrorDetailResponseImpl _$$ErrorDetailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ErrorDetailResponseImpl(
      code: json['code'] as String,
      detail: json['detail'] as String,
      attr: json['attr'] as String?,
    );

Map<String, dynamic> _$$ErrorDetailResponseImplToJson(
        _$ErrorDetailResponseImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'detail': instance.detail,
      'attr': instance.attr,
    };
