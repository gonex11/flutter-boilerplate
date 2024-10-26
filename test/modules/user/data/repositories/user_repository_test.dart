import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/core/common/exceptions.dart';
import 'package:flutter_boilerplate/core/common/failures.dart';
import 'package:flutter_boilerplate/modules/user/data/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helpers/test_helper.mocks.dart';

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
        'should return data and cache data locally when the call to data source is successful',
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
        'should return server failure when the call to data source is unsuccessful',
        () async {
      // Arrange
      when(mockRemoteDataSource.getUsers()).thenThrow(const ApiException(
        statusCode: 500,
        error: tBaseErrorResponse,
      ));
      // Act
      final result = await repository.getUsers();
      // Assert
      expect(result, const Left(ServerFailure(tBaseErrorResponse)));
    });
  });

  group('getCacheUsers', () {
    test('should return cache data when the call to data source is successful',
        () async {
      // Arrange
      when(mockLocalDataSource.getCacheUsers()).thenAnswer((_) => tUserModels);
      // Act
      final result = repository.getCacheUsers();
      // Assert
      expect(result, tUserModels);
    });
  });

  group('getUserById', () {
    const testId = 1;

    test(
        'should return a user by given id when the call to data source is successful',
        () async {
      // Arrange
      when(mockRemoteDataSource.getUserById(testId))
          .thenAnswer((_) async => tUserModel);
      // Act
      final result = await repository.getUserById(testId);
      // Assert
      expect(result, const Right(tUserModel));
    });

    test(
        'should return server failure when the call to data source is unsuccessful',
        () async {
      // Arrange
      when(mockRemoteDataSource.getUserById(testId))
          .thenThrow(const ApiException(
        statusCode: 404,
        error: tBaseErrorResponse,
      ));
      // Act
      final result = await repository.getUserById(testId);
      // Assert
      expect(result, const Left(ServerFailure(tBaseErrorResponse)));
    });
  });

  group('createUser', () {
    test(
        'should return created user when the call to data source is successful',
        () async {
      // Arrange
      when(mockRemoteDataSource.createUser(tUserPayload))
          .thenAnswer((_) async => tUserModel);
      // Act
      final result = await repository.createUser(tUserPayload);
      // Assert
      expect(result, const Right(tUserModel));
    });

    test(
        'should return server failure when the call to data source is unsuccessful',
        () async {
      // Arrange
      when(mockRemoteDataSource.createUser(tUserPayload))
          .thenThrow(const ApiException(
        statusCode: 404,
        error: tBaseErrorResponse,
      ));
      // Act
      final result = await repository.createUser(tUserPayload);
      // Assert
      expect(result, const Left(ServerFailure(tBaseErrorResponse)));
    });
  });
}
