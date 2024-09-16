import 'package:flutter_boilerplate/data/models/user_payload.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  test('should return a valid model from JSON', () async {
    // Arrange
    const Map<String, dynamic> jsonMap = tUserPayloadJson;
    // Act
    final result = UserPayload.fromJson(jsonMap);
    // Assert
    expect(result, tUserPayload);
  });

  test('should return a JSON map containing proper data', () async {
    // Act
    final result = tUserPayload.toJson();
    // Assert
    const expectedJsonMap = tUserPayloadJson;
    expect(result, expectedJsonMap);
  });
}
