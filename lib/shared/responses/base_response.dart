import 'package:flutter_boilerplate/shared/responses/meta_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/base_response.freezed.dart';
part 'generated/base_response.g.dart';

@Freezed(genericArgumentFactories: true)
class BaseResponse<T> with _$BaseResponse<T> {
  const factory BaseResponse({
    T? data,
    MetaResponse? meta,
  }) = _BaseResponse<T>;

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$BaseResponseFromJson<T>(json, fromJsonT);
}
