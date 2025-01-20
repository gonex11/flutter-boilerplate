import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/auth_validate_model.freezed.dart';
part 'generated/auth_validate_model.g.dart';

@Freezed()
class AuthValidateModel with _$AuthValidateModel {
  const factory AuthValidateModel({
    int? id,
    String? username,
    List<String>? hasGroups,
    List<String>? hasPermissions,
  }) = _AuthValidateModel;

  factory AuthValidateModel.fromJson(Map<String, dynamic> json) =>
      _$AuthValidateModelFromJson(json);
}
