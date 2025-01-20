import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'users')
class UserEntity extends Equatable {
  @primaryKey
  final int? id;
  final String? username;
  final String? firstName;
  final String? lastName;

  const UserEntity({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
  });

  @override
  List<Object?> get props => [id, username, firstName, lastName];
}
