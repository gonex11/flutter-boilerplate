import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/modules/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:flutter_boilerplate/modules/auth/data/models/token_model.dart';
import 'package:flutter_boilerplate/modules/user/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../helpers/test_helper.mocks.dart';
import '../../../../../json_reader.dart';

void main() {
  late AuthRemoteDataSource dataSource;
  late MockApiService mockApiService;

  setUp(() {
    mockApiService = MockApiService();
    dataSource = AuthRemoteDataSource(mockApiService);
  });

  group('getLoggedUser', () {
    final testUserModel = UserModel.fromJson(
      jsonDecode(readJson('dummy_data/jsons/user_response.json'))["data"],
    );

    test('should return a logged user when success', () async {
      // Arrange
      when(mockApiService.get('http://10.0.2.2:3000/auth/me')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(),
          statusCode: 200,
          data: jsonDecode(
            readJson('dummy_data/jsons/user_response.json'),
          ),
        ),
      );
      // Act
      final result = await dataSource.getLoggedUser();
      // Assert
      expect(result, testUserModel);
    });
  });

  group('login', () {
    const testUsername = 'username';
    const testPassword = 'password';
    final testTokenModel = TokenModel.fromJson(
      jsonDecode(readJson('dummy_data/jsons/token_response.json'))["data"],
    );

    test('should return access token and refresh token when success', () async {
      // Arrange
      when(mockApiService.post(
        'http://10.0.2.2:3000/auth/login',
        data: {
          'username': testUsername,
          'password': testPassword,
        },
        authorized: false,
      )).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(),
          statusCode: 200,
          data: jsonDecode(
            readJson('dummy_data/jsons/token_response.json'),
          ),
        ),
      );
      // Act
      final result = await dataSource.login(testUsername, testPassword);
      // Assert
      expect(result, testTokenModel);
    });
  });

  group('refreshToken', () {
    const testRefreshToken = 'refreshToken';
    final testTokenModel = TokenModel.fromJson(
      jsonDecode(readJson('dummy_data/jsons/token_response.json'))["data"],
    );

    test('should return access token and refresh token when success', () async {
      // Arrange
      when(mockApiService.post(
        'http://10.0.2.2:3000/auth/refresh',
        data: {'refresh_token': testRefreshToken},
        authorized: false,
      )).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(),
          statusCode: 200,
          data: jsonDecode(
            readJson('dummy_data/jsons/token_response.json'),
          ),
        ),
      );
      // Act
      final result = await dataSource.refreshToken(testRefreshToken);
      // Assert
      expect(result, testTokenModel);
    });
  });
}
