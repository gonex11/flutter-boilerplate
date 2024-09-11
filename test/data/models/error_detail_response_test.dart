import 'package:flutter_boilerplate/data/models/error_detail_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  test('should return a valid model from JSON', () async {
    // Arrange
    final Map<String, dynamic> jsonMap = tErrorDetailJson;
    // Act
    final result = ErrorDetailResponse.fromJson(jsonMap);
    // Assert
    expect(result, tErrorDetailResponse);
  });

  test('should return a JSON map containing proper data', () async {
    // Act
    final result = tErrorDetailResponse.toJson();
    // Assert
    final expectedJsonMap = tErrorDetailJson;
    expect(result, expectedJsonMap);
  });
}
