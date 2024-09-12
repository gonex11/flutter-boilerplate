import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/core/common/exceptions.dart';
import 'package:flutter_boilerplate/core/common/failures.dart';
import 'package:flutter_boilerplate/data/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late UserRepository repository;
  late MockUserRemoteDataSource mockRemoteDataSource;
  late MockUserLocalDataSource mockLocalDataSource;

  setUp(() {
    mockRemoteDataSource = MockUserRemoteDataSource();
    mockLocalDataSource = MockUserLocalDataSource();
    repository = UserRepository(
      mockRemoteDataSource,
      mockLocalDataSource,
    );
  });

  group('getUsers', () {
    test(
        'should return remote data and cache data locally when the call to remote data source is successful',
        () async {
      // Arrange
      when(mockRemoteDataSource.getUsers())
          .thenAnswer((_) async => tUserModels);
      when(mockLocalDataSource.cacheUsers(tUserModels))
          .thenAnswer((_) async => true);
      // Act
      final result = await repository.getUsers();
      // Assert
      final resultList = result.getOrElse(() => []);
      verify(mockRemoteDataSource.getUsers());
      verify(mockLocalDataSource.cacheUsers(tUserModels));
      expect(resultList, tUserModels);
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // Arrange
      when(mockRemoteDataSource.getUsers()).thenThrow(ApiException(
        statusCode: 500,
        error: tBaseErrorResponse,
      ));
      // Act
      final result = await repository.getUsers();
      // Assert
      expect(result, Left(ServerFailure(tBaseErrorResponse)));
    });
  });

  group('getCacheUsers', () {
    test(
        'should return cache data when the call to local data source is successful',
        () async {
      // Arrange
      when(mockLocalDataSource.getCacheUsers())
          .thenAnswer((_) async => tUserModels);
      // Act
      final result = await repository.getCacheUsers();
      // Assert
      expect(result, tUserModels);
    });
  });

  group('getUserById', () {
    final testId = 1;

    test(
        'should return a user by given id when the call to remote data source is successful',
        () async {
      // Arrange
      when(mockRemoteDataSource.getUserById(testId))
          .thenAnswer((_) async => tUserModel);
      // Act
      final result = await repository.getUserById(testId);
      // Assert
      expect(result, Right(tUserModel));
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // Arrange
      when(mockRemoteDataSource.getUserById(testId)).thenThrow(ApiException(
        statusCode: 404,
        error: tBaseErrorResponse,
      ));
      // Act
      final result = await repository.getUserById(testId);
      // Assert
      expect(result, Left(ServerFailure(tBaseErrorResponse)));
    });
  });

  group('createUser', () {
    test(
        'should return created user when the call to remote data source is successful',
        () async {
      // Arrange
      when(mockRemoteDataSource.createUser(tUserPayload))
          .thenAnswer((_) async => tUserModel);
      // Act
      final result = await repository.createUser(tUserPayload);
      // Assert
      expect(result, Right(tUserModel));
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // Arrange
      when(mockRemoteDataSource.createUser(tUserPayload))
          .thenThrow(ApiException(
        statusCode: 404,
        error: tBaseErrorResponse,
      ));
      // Act
      final result = await repository.createUser(tUserPayload);
      // Assert
      expect(result, Left(ServerFailure(tBaseErrorResponse)));
    });
  });
}
