// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../meta_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MetaResponseImpl _$$MetaResponseImplFromJson(Map<String, dynamic> json) =>
    _$MetaResponseImpl(
      page: (json['page'] as num).toInt(),
      totalData: (json['totalData'] as num).toInt(),
      totalPage: (json['totalPage'] as num).toInt(),
    );

Map<String, dynamic> _$$MetaResponseImplToJson(_$MetaResponseImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'totalData': instance.totalData,
      'totalPage': instance.totalPage,
    };
