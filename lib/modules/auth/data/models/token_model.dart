import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/token_model.freezed.dart';
part 'generated/token_model.g.dart';

@Freezed()
class TokenModel with _$TokenModel {
  const factory TokenModel({
    required String accessToken,
    required String refreshToken,
  }) = _TokenModel;

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);
}
