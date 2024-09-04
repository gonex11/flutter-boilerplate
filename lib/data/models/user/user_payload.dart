import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UserPayload {
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

  factory UserPayload.fromJson(Map<String, dynamic> json) {
    return UserPayload(
      username: json['username'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
      'password': password,
    };
  }
}
