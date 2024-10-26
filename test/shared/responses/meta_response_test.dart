import 'package:flutter_boilerplate/shared/responses/meta_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  test('should return a valid model from JSON', () async {
    // Arrange
    const Map<String, dynamic> jsonMap = tMetaJson;
    // Act
    final result = MetaResponse.fromJson(jsonMap);
    // Assert
    expect(result, tMetaResponse);
  });

  test('should return a JSON map containing proper data', () async {
    // Act
    final result = tMetaResponse.toJson();
    // Assert
    const expectedJsonMap = tMetaJson;
    expect(result, expectedJsonMap);
  });
}
