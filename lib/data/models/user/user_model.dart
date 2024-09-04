import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  final int? id;
  final String? username;
  final String? firstName;
  final String? lastName;

  UserModel({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [id, username, firstName, lastName];
}
