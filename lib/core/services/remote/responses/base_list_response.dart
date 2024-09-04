import 'package:equatable/equatable.dart';
import 'package:flutter_boilerplate/core/services/remote/responses/meta_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_list_response.g.dart';

@JsonSerializable()
class BaseListResponse<T> extends Equatable {
  final MetaResponse meta;
  final List<T> data;

  const BaseListResponse({
    required this.meta,
    required this.data,
  });

  factory BaseListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseListResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseListResponseToJson(this, toJsonT);

  @override
  List<Object?> get props => [meta, data];
}
