import 'package:flutter_boilerplate/modules/user/data/data_sources/local/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/user_model.freezed.dart';
part 'generated/user_model.g.dart';

@Freezed()
class UserModel with _$UserModel {
  const factory UserModel({
    final int? id,
    final String? username,
    final String? firstName,
    final String? lastName,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      username: entity.username,
      firstName: entity.firstName,
      lastName: entity.lastName,
    );
  }
}

extension UserModelExt on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      username: username,
      firstName: firstName,
      lastName: lastName,
    );
  }
}
