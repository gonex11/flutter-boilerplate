import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/core/services/api_service.dart';
import 'package:flutter_boilerplate/modules/user/data/data_sources/user_remote_data_source.dart';
import 'package:flutter_boilerplate/shared/responses/base_list_response.dart';
import 'package:flutter_boilerplate/modules/user/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helpers/test_helper.mocks.dart';
import '../../../../json_reader.dart';

void main() {
  late UserRemoteDataSource dataSource;
  late ApiService mockApiService;

  setUp(() {
    mockApiService = MockApiService();
    dataSource = UserRemoteDataSource(mockApiService);
  });

  group('getUsers', () {
    final testUserModels = BaseListResponse.fromJson(
      jsonDecode(readJson('dummy_data/jsons/list_user_response.json')),
      (json) => UserModel.fromJson(json as Map<String, dynamic>),
    ).data;

    test('should return a list of users when success', () async {
      // Arrange
      when(mockApiService.get('http://10.0.2.2:3000/users')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(),
          statusCode: 200,
          data: jsonDecode(
            readJson('dummy_data/jsons/list_user_response.json'),
          ),
        ),
      );
      // Act
      final result = await dataSource.getUsers();
      // Assert
      expect(result, testUserModels);
    });
  });

  group('getUserById', () {
    const testId = 1;
    final testUserModel = UserModel.fromJson(
      jsonDecode(readJson('dummy_data/jsons/user_response.json'))["data"],
    );

    test('should return a users by given id when success', () async {
      // Arrange
      when(mockApiService.get('http://10.0.2.2:3000/users/$testId')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(),
          statusCode: 200,
          data: jsonDecode(
            readJson('dummy_data/jsons/user_response.json'),
          ),
        ),
      );
      // Act
      final result = await dataSource.getUserById(testId);
      // Assert
      expect(result, testUserModel);
    });
  });

  group('createUser', () {
    final testUserModel = UserModel.fromJson(
      jsonDecode(readJson('dummy_data/jsons/user_response.json'))["data"],
    );

    test('should create user when success', () async {
      // Arrange
      when(mockApiService.post(
        'http://10.0.2.2:3000/users',
        data: tUserPayload.toJson(),
      )).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(),
          statusCode: 201,
          data: jsonDecode(
            readJson('dummy_data/jsons/user_response.json'),
          ),
        ),
      );
      // Act
      final result = await dataSource.createUser(tUserPayload);
      // Assert
      expect(result, testUserModel);
    });
  });
}
