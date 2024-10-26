import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'generated/user_type.g.dart';

@HiveType(typeId: 1)
class UserType extends Equatable {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? username;
  @HiveField(2)
  final String? firstName;
  @HiveField(3)
  final String? lastName;

  const UserType({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
  });

  @override
  List<Object?> get props => [id, username, firstName, lastName];
}
