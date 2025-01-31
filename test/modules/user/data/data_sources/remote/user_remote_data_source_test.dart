import 'dart:convert';

import 'package:flutter_boilerplate/modules/user/data/data_sources/remote/user_remote_data_source.dart';
import 'package:flutter_boilerplate/modules/user/data/models/user_model.dart';
import 'package:flutter_boilerplate/shared/responses/base_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../dummy_data/dummy_objects.dart';
import '../../../../../helpers/test_helper.mocks.dart';
import '../../../../../json_reader.dart';

void main() {
  late UserRemoteDataSource dataSource;
  late MockUserService mockUserService;

  setUp(() {
    mockUserService = MockUserService();
    dataSource = UserRemoteDataSource(mockUserService);
  });

  group('fetchUsers', () {
    const testPage = 1;
    const testLimit = 10;

    final testUserModels = BaseResponse.fromJson(
      jsonDecode(readJson('dummy_data/jsons/list_user_response.json')),
      (json) => (json as List).map((e) => UserModel.fromJson(e)).toList(),
    );

    test('should return a list of users when success', () async {
      // Arrange
      when(mockUserService.fetchUsers(testPage, testLimit)).thenAnswer(
        (_) async => testUserModels,
      );
      // Act
      final result =
          await dataSource.fetchUsers(page: testPage, limit: testLimit);
      // Assert
      expect(result, testUserModels);
    });
  });

  group('getUserById', () {
    const testId = 1;
    final testUserModel = BaseResponse.fromJson(
      jsonDecode(readJson('dummy_data/jsons/user_response.json')),
      (json) => UserModel.fromJson(json as Map<String, dynamic>),
    );

    test('should return a users by given id when success', () async {
      // Arrange
      when(mockUserService.getUserById(testId)).thenAnswer(
        (_) async => testUserModel,
      );
      // Act
      final result = await dataSource.getUserById(testId);
      // Assert
      expect(result, testUserModel);
    });
  });

  group('addUser', () {
    final testUserModel = BaseResponse.fromJson(
      jsonDecode(readJson('dummy_data/jsons/user_response.json')),
      (json) => UserModel.fromJson(json as Map<String, dynamic>),
    );

    test('should create user when success', () async {
      // Arrange
      when(mockUserService.addUser(tUserPayload)).thenAnswer(
        (_) async => testUserModel,
      );
      // Act
      final result = await dataSource.addUser(tUserPayload);
      // Assert
      expect(result, testUserModel);
    });
  });
}
