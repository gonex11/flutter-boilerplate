import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_object_response.g.dart';

@JsonSerializable()
class BaseObjectResponse<T> extends Equatable {
  final T data;

  const BaseObjectResponse({required this.data});

  factory BaseObjectResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseObjectResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseObjectResponseToJson(this, toJsonT);

  @override
  List<Object?> get props => [data];
}
