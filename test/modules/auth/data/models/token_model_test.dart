import 'package:flutter_boilerplate/modules/auth/data/models/token_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../dummy_data/dummy_objects.dart';

void main() {
  test('should return a valid model from JSON', () async {
    // Arrange
    const Map<String, dynamic> jsonMap = tTokenJson;
    // Act
    final result = TokenModel.fromJson(jsonMap);
    // Assert
    expect(result, tTokenModel);
  });

  test('should return a JSON map containing proper data', () async {
    // Act
    final result = tTokenModel.toJson();
    // Assert
    const expectedJsonMap = tTokenJson;
    expect(result, expectedJsonMap);
  });
}
