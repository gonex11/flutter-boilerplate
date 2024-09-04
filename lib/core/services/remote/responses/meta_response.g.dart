// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaResponse _$MetaResponseFromJson(Map<String, dynamic> json) => MetaResponse(
      page: (json['page'] as num).toInt(),
      totalData: (json['totalData'] as num).toInt(),
      totalPage: (json['totalPage'] as num).toInt(),
    );

Map<String, dynamic> _$MetaResponseToJson(MetaResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'totalData': instance.totalData,
      'totalPage': instance.totalPage,
    };
