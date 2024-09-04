import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_payload.g.dart';

@JsonSerializable()
class UserPayload extends Equatable {
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? password;

  UserPayload({
    this.username,
    this.firstName,
    this.lastName,
    this.password,
  });

  factory UserPayload.fromJson(Map<String, dynamic> json) =>
      _$UserPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$UserPayloadToJson(this);

  @override
  List<Object?> get props => [username, firstName, lastName, password];
}
