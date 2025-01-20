import 'package:flutter_boilerplate/modules/auth/data/models/auth_validate_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../dummy_data/dummy_objects.dart';

void main() {
  test('should return a valid model from JSON', () async {
    // Arrange
    const Map<String, dynamic> jsonMap = tAuthValidateJson;
    // Act
    final result = AuthValidateModel.fromJson(jsonMap);
    // Assert
    expect(result, tAuthValidateModel);
  });

  test('should return a JSON map containing proper data', () async {
    // Act
    final result = tAuthValidateModel.toJson();
    // Assert
    const expectedJsonMap = tAuthValidateJson;
    expect(result, expectedJsonMap);
  });
}
