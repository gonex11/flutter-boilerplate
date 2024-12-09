import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/core/common/exceptions.dart';
import 'package:flutter_boilerplate/core/common/failures.dart';
import 'package:flutter_boilerplate/modules/auth/data/repositories/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late AuthRepository repository;
  late MockAuthRemoteDataSource mockRemoteDataSource;
  late MockAuthLocalDataSource mockLocalDataSource;
  late MockTokenManager mockTokenManager;

  setUp(() {
    mockRemoteDataSource = MockAuthRemoteDataSource();
    mockLocalDataSource = MockAuthLocalDataSource();
    mockTokenManager = MockTokenManager();
    repository = AuthRepository(
      mockRemoteDataSource,
      mockLocalDataSource,
      mockTokenManager,
    );
  });

  final tAccessToken = tTokenModel.accessToken;

  group('validateAuth', () {
    test(
        'should return current auth data when the call to data source is successful',
        () async {
      // Arrange
      when(mockLocalDataSource.getAccessToken())
          .thenAnswer((_) async => tAccessToken);
      when(mockTokenManager.isTokenExpired(tAccessToken))
          .thenAnswer((_) => false);
      when(mockTokenManager.decodeToken(tAccessToken))
          .thenAnswer((_) => tAuthValidateModel.toJson());
      // Act
      final result = await repository.validateAuth();
      // Assert
      expect(result, const Right(tAuthValidateModel));
    });

    test(
        'should return auth failure and clear session when the decoded token is empty',
        () async {
      // Arrange
      when(mockLocalDataSource.getAccessToken())
          .thenAnswer((_) async => tAccessToken);
      when(mockTokenManager.isTokenExpired(tAccessToken))
          .thenAnswer((_) => false);
      when(mockTokenManager.decodeToken(tAccessToken)).thenAnswer((_) => {});
      when(mockLocalDataSource.clearSession()).thenAnswer((_) async => true);
      // Act
      final result = await repository.validateAuth();
      // Assert
      expect(result, const Left(AuthFailure()));
    });

    test(
        'should return auth failure and clear session when access token not saved in local',
        () async {
      // Arrange
      when(mockLocalDataSource.getAccessToken()).thenAnswer((_) async => null);
      when(mockLocalDataSource.clearSession()).thenAnswer((_) async => true);
      // Act
      final result = await repository.validateAuth();
      // Assert
      expect(result, const Left(AuthFailure()));
    });

    test('should return auth failure and clear session when token is expired',
        () async {
      // Arrange
      when(mockLocalDataSource.getAccessToken())
          .thenAnswer((_) async => tAccessToken);
      when(mockTokenManager.isTokenExpired(tAccessToken))
          .thenAnswer((_) => true);
      when(mockLocalDataSource.clearSession()).thenAnswer((_) async => true);
      // Act
      final result = await repository.validateAuth();
      // Assert
      expect(result, const Left(AuthFailure()));
    });
  });

  group('login', () {
    test(
        'should return logged user and save token to local when login successfully',
        () async {
      // Arrange
      when(mockRemoteDataSource.login(tLoginPayload))
          .thenAnswer((_) async => tTokenModel);
      when(mockLocalDataSource.setToken(tTokenModel))
          .thenAnswer((_) async => true);
      // Act
      final result = await repository.login(tLoginPayload);
      // Assert
      expect(result, const Right(tTokenModel));
    });

    test('should return server failure when login unsuccessfully', () async {
      // Arrange
      when(mockRemoteDataSource.login(tLoginPayload))
          .thenThrow(const ApiException(
        statusCode: 401,
        error: tBaseErrorResponse,
      ));
      // Act
      final result = await repository.login(tLoginPayload);
      // Assert
      expect(result, const Left(ServerFailure(tBaseErrorResponse)));
    });
  });

  group('logout', () {
    test('should return true and clear session when logout successfully',
        () async {
      // Arrange
      when(mockLocalDataSource.clearSession()).thenAnswer((_) async => true);
      // Act
      final result = await repository.logout();
      // Assert
      expect(result, true);
    });

    test('should return false when logout unsuccessfully', () async {
      // Arrange
      when(mockLocalDataSource.clearSession()).thenAnswer((_) async => false);
      // Act
      final result = await repository.logout();
      // Assert
      expect(result, false);
    });
  });
}
