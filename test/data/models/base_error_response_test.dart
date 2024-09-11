import 'package:flutter_boilerplate/data/models/base_error_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  test('should return a valid model froom JSON', () async {
    // Arrange
    final Map<String, dynamic> jsonMap = tBaseErrorJson;
    // Act
    final result = BaseErrorResponse.fromJson(jsonMap);
    // Assert
    expect(result, tBaseErrorResponse);
  });

  test('should return a JSON map containing proper data', () async {
    // Act
    final result = tBaseErrorResponse.toJson();
    // Assert
    final expectedJsonMap = tBaseErrorJson;
    expect(result, expectedJsonMap);
  });
}
