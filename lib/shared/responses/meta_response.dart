import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/meta_response.freezed.dart';
part 'generated/meta_response.g.dart';

@Freezed()
class MetaResponse with _$MetaResponse {
  const factory MetaResponse({
    int? page,
    int? totalData,
    int? totalPage,
  }) = _MetaResponse;

  factory MetaResponse.fromJson(Map<String, dynamic> json) =>
      _$MetaResponseFromJson(json);
}
