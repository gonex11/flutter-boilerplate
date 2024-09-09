import 'package:equatable/equatable.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/services/responses/error_detail_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/base_error_response.g.dart';

@JsonSerializable()
class BaseErrorResponse extends Equatable {
  final String? type;
  final List<ErrorDetailResponse>? errors;

  const BaseErrorResponse({
    required this.type,
    required this.errors,
  });

  factory BaseErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseErrorResponseToJson(this);

  @override
  List<Object?> get props => [type, errors];
}
