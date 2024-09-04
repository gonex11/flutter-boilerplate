import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/meta_response.g.dart';

@JsonSerializable()
class MetaResponse extends Equatable {
  final int page;
  final int totalData;
  final int totalPage;

  const MetaResponse({
    required this.page,
    required this.totalData,
    required this.totalPage,
  });

  factory MetaResponse.fromJson(Map<String, dynamic> json) =>
      _$MetaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MetaResponseToJson(this);

  @override
  List<Object?> get props => [page, totalData, totalPage];
}
