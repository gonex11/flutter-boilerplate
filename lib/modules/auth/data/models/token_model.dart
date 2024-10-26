import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/token_model.g.dart';

@JsonSerializable()
class TokenModel extends Equatable {
  final String accessToken;
  final String refreshToken;

  const TokenModel({
    required this.accessToken,
    required this.refreshToken,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);

  @override
  List<Object?> get props => [accessToken, refreshToken];
}
