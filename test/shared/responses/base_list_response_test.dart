import 'package:flutter_boilerplate/shared/responses/base_list_response.dart';
import 'package:flutter_boilerplate/modules/user/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  test('should return a valid model from JSON', () async {
    // Arrange
    final Map<String, dynamic> jsonMap = tBaseListJson;
    // Act
    final result = BaseListResponse.fromJson(
      jsonMap,
      (json) => UserModel.fromJson(json as Map<String, dynamic>),
    );
    // Assert
    expect(result, tBaseListResponse);
  });

  test('should return a JSON map containing proper data', () async {
    // Act
    final result = tBaseListResponse.toJson(
      (user) => user.toJson(),
    );
    // Assert
    final expectedJsonMap = tBaseListJson;
    expect(result, expectedJsonMap);
  });
}
