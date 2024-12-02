import 'package:flutter_boilerplate/shared/responses/meta_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/base_list_response.freezed.dart';
part 'generated/base_list_response.g.dart';

@Freezed(genericArgumentFactories: true)
class BaseListResponse<T> with _$BaseListResponse<T> {
  const factory BaseListResponse({
    MetaResponse? meta,
    required List<T> data,
  }) = _BaseListResponse<T>;

  factory BaseListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$BaseListResponseFromJson<T>(json, fromJsonT);
}
