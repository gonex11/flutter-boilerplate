import 'package:flutter_boilerplate/modules/user/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../dummy_data/dummy_objects.dart';

void main() {
  test('should return a valid model from JSON', () async {
    // Arrange
    const Map<String, dynamic> jsonMap = tUserJson;
    // Act
    final result = UserModel.fromJson(jsonMap);
    // Assert
    expect(result, tUserModel);
  });

  test('should return a valid model from Entity', () async {
    // Arrange
    const userEntity = tUserEntity;
    // Act
    final result = UserModel.fromEntity(userEntity);
    // Assert
    expect(result, tUserModel);
  });

  test('should return a JSON map containing proper data', () async {
    // Act
    final result = tUserModel.toJson();
    // Assert
    const expectedJsonMap = tUserJson;
    expect(result, expectedJsonMap);
  });

  test('should return a Entity containing proper data', () async {
    // Act
    final result = tUserModel.toEntity();
    // Assert
    expect(result, tUserEntity);
  });
}
