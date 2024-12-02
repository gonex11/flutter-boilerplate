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
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockUserRemoteDataSource();
    mockLocalDataSource = MockUserLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = UserRepository(
      mockRemoteDataSource,
      mockLocalDataSource,
      mockNetworkInfo,
    );
  });

  group('getUsers', () {
    group('when the device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          'should return data and cache data locally when the call to remote data source is successful',
          () async {
        // Arrange
        when(mockLocalDataSource.cacheUsers(tUserModels))
            .thenAnswer((_) async => true);
        when(mockRemoteDataSource.getUsers())
            .thenAnswer((_) async => tUserModels);
        // Act
        final result = await repository.getUsers();
        // Assert
        verify(mockRemoteDataSource.getUsers());
        verify(mockLocalDataSource.cacheUsers(tUserModels));
        final resultList = result.getOrElse(() => []);
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

    group('when the device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('should return cached data when device is offline', () async {
        // Arrange
        when(mockLocalDataSource.getCachedUsers())
            .thenAnswer((_) async => tUserModels);
        // Act
        final result = await repository.getUsers();
        // Assert
        final resultList = result.getOrElse(() => []);
        expect(resultList, tUserModels);
      });

      test('should return CacheFailure when app has no cache', () async {
        // arrange
        when(mockLocalDataSource.getCachedUsers())
            .thenThrow(const DatabaseException('No Cache'));
        // act
        final result = await repository.getUsers();
        // assert
        verify(mockLocalDataSource.getCachedUsers());
        expect(result, const Left(CacheFailure('No Cache')));
      });
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
