import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_detail_response.g.dart';

@JsonSerializable()
class ErrorDetailResponse extends Equatable {
  final String code;
  final String detail;
  final String? attr;

  const ErrorDetailResponse({
    required this.code,
    required this.detail,
    this.attr,
  });

  factory ErrorDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorDetailResponseToJson(this);

  @override
  List<Object?> get props => [code, detail, attr];
}
