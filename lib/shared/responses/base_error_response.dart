import 'package:flutter_boilerplate/shared/responses/error_detail_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/base_error_response.freezed.dart';
part 'generated/base_error_response.g.dart';

@Freezed()
class BaseErrorResponse with _$BaseErrorResponse {
  const factory BaseErrorResponse({
    String? type,
    List<ErrorDetailResponse>? errors,
  }) = _BaseErrorResponse;

  factory BaseErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseErrorResponseFromJson(json);
}
