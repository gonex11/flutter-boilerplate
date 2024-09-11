import 'package:flutter_boilerplate/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  test('should return a valid model from JSON', () async {
    // Arrange
    final Map<String, dynamic> jsonMap = tUserJson;
    // Act
    final result = UserModel.fromJson(jsonMap);
    // Assert
    expect(result, tUserModel);
  });

  test('should return a valid model from Adapter', () async {
    // Arrange
    final userAdapter = tUserAdapter;
    // Act
    final result = UserModel.fromAdapter(userAdapter);
    // Assert
    expect(result, tUserModel);
  });

  test('should return a JSON map containing proper data', () async {
    // Act
    final result = tUserModel.toJson();
    // Assert
    final expectedJsonMap = tUserJson;
    expect(result, expectedJsonMap);
  });

  test('should return a Adapter containing proper data', () async {
    // Act
    final result = tUserModel.toAdapter();
    // Assert
    expect(result, tUserAdapter);
  });
}
