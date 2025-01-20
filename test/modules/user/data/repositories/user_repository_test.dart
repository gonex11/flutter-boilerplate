import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/core/common/exceptions.dart';
import 'package:flutter_boilerplate/core/common/failures.dart';
import 'package:flutter_boilerplate/modules/user/data/repositories/user_repository.dart';
import 'package:flutter_boilerplate/shared/responses/base_response.dart';
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

  group('fetchUsers', () {
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
        when(mockRemoteDataSource.fetchUsers()).thenAnswer(
          (_) async => BaseResponse(data: tUserModels, meta: tMetaResponse),
        );
        // Act
        final result = await repository.fetchUsers();
        // Assert
        verify(mockRemoteDataSource.fetchUsers());
        verify(mockLocalDataSource.cacheUsers(tUserModels));
        final resultList = result.getOrElse(() => []);
        expect(resultList, tUserModels);
      });

      test(
          'should return server failure when the call to data source is unsuccessful',
          () async {
        // Arrange
        when(mockRemoteDataSource.fetchUsers()).thenThrow(const ApiException(
          statusCode: 500,
          error: tBaseErrorResponse,
        ));
        // Act
        final result = await repository.fetchUsers();
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
        final result = await repository.fetchUsers();
        // Assert
        final resultList = result.getOrElse(() => []);
        expect(resultList, tUserModels);
      });

      test('should return CacheFailure when app has no cache', () async {
        // arrange
        when(mockLocalDataSource.getCachedUsers())
            .thenThrow(const DatabaseException('No Cache'));
        // act
        final result = await repository.fetchUsers();
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
          .thenAnswer((_) async => const BaseResponse(data: tUserModel));
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

  group('addUser', () {
    test(
        'should return created user when the call to data source is successful',
        () async {
      // Arrange
      when(mockRemoteDataSource.addUser(tUserPayload))
          .thenAnswer((_) async => const BaseResponse(data: tUserModel));
      // Act
      final result = await repository.addUser(tUserPayload);
      // Assert
      expect(result, const Right(tUserModel));
    });

    test(
        'should return server failure when the call to data source is unsuccessful',
        () async {
      // Arrange
      when(mockRemoteDataSource.addUser(tUserPayload))
          .thenThrow(const ApiException(
        statusCode: 404,
        error: tBaseErrorResponse,
      ));
      // Act
      final result = await repository.addUser(tUserPayload);
      // Assert
      expect(result, const Left(ServerFailure(tBaseErrorResponse)));
    });
  });
}
