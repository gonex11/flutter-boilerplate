import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/error_detail_response.freezed.dart';
part 'generated/error_detail_response.g.dart';

@Freezed()
class ErrorDetailResponse with _$ErrorDetailResponse {
  const factory ErrorDetailResponse({
    required String code,
    required String detail,
    String? attr,
  }) = _ErrorDetailResponse;

  factory ErrorDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailResponseFromJson(json);
}
