import 'dart:convert';

import 'package:flutter_boilerplate/core/common/app_constants.dart';
import 'package:flutter_boilerplate/data/data_sources/local/auth_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late AuthLocalDataSource dataSource;
  late MockFlutterSecureStorage mockFlutterSecureStorage;
  late MockTokenManager mockTokenManager;

  setUp(() {
    mockFlutterSecureStorage = MockFlutterSecureStorage();
    mockTokenManager = MockTokenManager();
    dataSource = AuthLocalDataSource(
      mockFlutterSecureStorage,
      mockTokenManager,
    );
  });

  final tRefreshTokenKey = AppConstants.secureStorageKeys.refreshToken;
  final tAccessTokenKey = AppConstants.secureStorageKeys.accessToken;
  final tUserSessionKey = AppConstants.secureStorageKeys.userSession;

  final tRefreshToken = tTokenModel.refreshToken;
  final tAccessToken = tTokenModel.accessToken;

  group('isTokenExpired', () {
    test('should return true when token is expired', () async {
      // Arrange
      when(mockFlutterSecureStorage.read(key: tAccessTokenKey))
          .thenAnswer((_) async => tAccessToken);
      when(mockTokenManager.isTokenExpired(tAccessToken))
          .thenAnswer((_) async => true);
      // Act
      final result = await dataSource.isTokenExpired();
      // Assert
      expect(result, true);
    });

    test('should return false when token is null', () async {
      // Arrange
      when(mockFlutterSecureStorage.read(key: tAccessTokenKey))
          .thenAnswer((_) async => null);
      when(mockTokenManager.isTokenExpired(tAccessToken))
          .thenAnswer((_) async => false);
      // Act
      final result = await dataSource.isTokenExpired();
      // Assert
      expect(result, false);
    });
  });

  group('setUserSession', () {
    test('should return true when set user session is success', () async {
      // Arrange
      when(mockFlutterSecureStorage.write(
              key: tUserSessionKey, value: jsonEncode(tUserModel.toJson())))
          .thenAnswer((_) async => true);
      // Act
      final result = await dataSource.setUserSession(tUserModel);
      // Assert
      expect(result, true);
    });

    test('should return false when set user session is success', () async {
      // Arrange
      when(mockFlutterSecureStorage.write(
              key: tUserSessionKey, value: jsonEncode(tUserModel.toJson())))
          .thenThrow(Exception());
      // Act
      final result = await dataSource.setUserSession(tUserModel);
      // Assert
      expect(result, false);
    });
  });

  group('getUserSession', () {
    test('should return user when get data is success', () async {
      // Arrange
      when(mockFlutterSecureStorage.read(key: tUserSessionKey))
          .thenAnswer((_) async => jsonEncode(tUserModel.toJson()));
      // Act
      final result = await dataSource.getUserSession();
      // Assert
      expect(result, tUserModel);
    });

    test('should return null when get data is failed', () async {
      // Arrange
      when(mockFlutterSecureStorage.read(key: tUserSessionKey))
          .thenAnswer((_) async => null);
      // Act
      final result = await dataSource.getUserSession();
      // Assert
      expect(result, null);
    });
  });

  group('setToken', () {
    test('should return true when set token is success', () async {
      // Arrange
      when(mockFlutterSecureStorage.write(
              key: tRefreshTokenKey, value: tRefreshToken))
          .thenAnswer((_) async => true);
      when(mockFlutterSecureStorage.write(
              key: tAccessTokenKey, value: tAccessToken))
          .thenAnswer((_) async => true);
      // Act
      final result = await dataSource.setToken(tTokenModel);
      // Assert
      expect(result, true);
    });

    test('should return false when set token is failed', () async {
      // Arrange
      when(mockFlutterSecureStorage.write(
        key: tRefreshTokenKey,
        value: tRefreshToken,
      )).thenThrow(Exception());
      when(mockFlutterSecureStorage.write(
        key: tAccessTokenKey,
        value: tAccessToken,
      )).thenAnswer((_) async => true);
      // Act
      final result = await dataSource.setToken(tTokenModel);
      // Assert
      expect(result, false);
    });
  });

  group('getAccessToken', () {
    test('should return access token when get access token is success',
        () async {
      // Arrange
      when(mockFlutterSecureStorage.read(key: tAccessTokenKey))
          .thenAnswer((_) async => tAccessToken);
      // Act
      final result = await dataSource.getAccessToken();
      // Assert
      expect(result, tAccessToken);
    });

    test('should return null when get access token is failed', () async {
      // Arrange
      when(mockFlutterSecureStorage.read(key: tAccessTokenKey))
          .thenAnswer((_) async => null);
      // Act
      final result = await dataSource.getAccessToken();
      // Assert
      expect(result, null);
    });
  });

  group('getRefreshToken', () {
    test('should return access token when get refresh token is success',
        () async {
      // Arrange
      when(mockFlutterSecureStorage.read(key: tRefreshTokenKey))
          .thenAnswer((_) async => tRefreshToken);
      // Act
      final result = await dataSource.getRefreshToken();
      // Assert
      expect(result, tRefreshToken);
    });

    test('should return null when get refresh token is failed', () async {
      // Arrange
      when(mockFlutterSecureStorage.read(key: tRefreshTokenKey))
          .thenAnswer((_) async => null);
      // Act
      final result = await dataSource.getRefreshToken();
      // Assert
      expect(result, null);
    });
  });

  group('clearSession', () {
    test('should return true when clear session is success', () async {
      // Arrange
      when(mockFlutterSecureStorage.delete(key: tAccessTokenKey))
          .thenAnswer((_) async => true);
      when(mockFlutterSecureStorage.delete(key: tRefreshTokenKey))
          .thenAnswer((_) async => true);
      when(mockFlutterSecureStorage.delete(key: tUserSessionKey))
          .thenAnswer((_) async => true);
      // Act
      final result = await dataSource.clearSession();
      // Assert
      expect(result, true);
    });

    test('should return false when clear session is failed', () async {
      // Arrange
      when(mockFlutterSecureStorage.delete(key: tAccessTokenKey))
          .thenThrow(Exception());
      when(mockFlutterSecureStorage.delete(key: tRefreshTokenKey))
          .thenAnswer((_) async => true);
      when(mockFlutterSecureStorage.delete(key: tUserSessionKey))
          .thenAnswer((_) async => true);
      // Act
      final result = await dataSource.clearSession();
      // Assert
      expect(result, false);
    });
  });
}
