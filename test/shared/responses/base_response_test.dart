import 'package:flutter_boilerplate/modules/user/data/models/user_model.dart';
import 'package:flutter_boilerplate/shared/responses/base_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  test('should return a valid model from JSON', () async {
    // Arrange
    final Map<String, dynamic> jsonMap = tBaseJson;
    // Act
    final result = BaseResponse.fromJson(
      jsonMap,
      (json) => (json as List).map((e) => UserModel.fromJson(e)).toList(),
    );
    // Assert
    expect(result, tBaseResponse);
  });

  test('should return a JSON map containing proper data', () async {
    // Act
    final result = tBaseResponse.toJson(
      (user) => user.map((e) => e.toJson()).toList(),
    );
    // Assert
    final expectedJsonMap = tBaseJson;
    expect(result, expectedJsonMap);
  });
}
