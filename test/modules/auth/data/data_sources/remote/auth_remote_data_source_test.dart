import 'dart:convert';

import 'package:flutter_boilerplate/modules/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:flutter_boilerplate/modules/auth/data/models/token_model.dart';
import 'package:flutter_boilerplate/shared/responses/base_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../dummy_data/dummy_objects.dart';
import '../../../../../helpers/test_helper.mocks.dart';
import '../../../../../json_reader.dart';

void main() {
  late AuthRemoteDataSource dataSource;
  late MockAuthService mockAuthService;

  setUp(() {
    mockAuthService = MockAuthService();
    dataSource = AuthRemoteDataSource(mockAuthService);
  });

  group('login', () {
    final testTokenModel = BaseResponse.fromJson(
      jsonDecode(readJson('dummy_data/jsons/token_response.json')),
      (json) => TokenModel.fromJson(json as Map<String, dynamic>),
    );

    test('should return access token and refresh token when success', () async {
      // Arrange
      when(mockAuthService.login(tLoginPayload)).thenAnswer(
        (_) async => testTokenModel,
      );
      // Act
      final result = await dataSource.login(tLoginPayload);
      // Assert
      expect(result, testTokenModel);
    });
  });
}
