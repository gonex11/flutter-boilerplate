import 'package:equatable/equatable.dart';
import 'package:flutter_boilerplate/modules/user/data/models/user_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  final int? id;
  final String? username;
  final String? firstName;
  final String? lastName;

  const UserModel({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromAdapter(UserType user) {
    return UserModel(
      id: user.id,
      username: user.username,
      firstName: user.firstName,
      lastName: user.lastName,
    );
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserType toAdapter() {
    return UserType(
      id: id,
      username: username,
      firstName: firstName,
      lastName: lastName,
    );
  }

  @override
  List<Object?> get props => [id, username, firstName, lastName];
}
