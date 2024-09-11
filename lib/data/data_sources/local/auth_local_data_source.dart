import 'dart:convert';

import 'package:flutter_boilerplate/core/common/app_constants.dart';
import 'package:flutter_boilerplate/data/data_sources/local/db/secure_storage.dart';
import 'package:flutter_boilerplate/data/models/user/user_model.dart';

class AuthLocalDataSource {
  final SecureStorage _secureStorage;
  final bool Function(String token) _isExpired;

  AuthLocalDataSource(this._secureStorage, this._isExpired);

  Future<bool> isTokenExpired() async {
    final key = AppConstants.secureStorageKeys.accessToken;
    final accessToken = await _secureStorage.read(key);

    if (accessToken == null) return false;
    return _isExpired(accessToken);
  }

  Future<void> setUserSession(UserModel user) async {
    await _secureStorage.write(
      AppConstants.secureStorageKeys.userSession,
      jsonEncode(user.toJson()),
    );
  }

  Future<UserModel?> getUserSession() async {
    final result = await _secureStorage.read(
      AppConstants.secureStorageKeys.userSession,
    );

    if (result == null) return null;
    return UserModel.fromJson(jsonDecode(result));
  }

  Future<void> setAccessToken(String token) async {
    final key = AppConstants.secureStorageKeys.accessToken;
    return await _secureStorage.write(key, token);
  }

  Future<void> setRefreshToken(String token) async {
    final key = AppConstants.secureStorageKeys.refreshToken;
    return await _secureStorage.write(key, token);
  }

  Future<String?> getAccessToken() async {
    final key = AppConstants.secureStorageKeys.accessToken;
    return await _secureStorage.read(key);
  }

  Future<String?> getRefreshToken() async {
    final key = AppConstants.secureStorageKeys.refreshToken;
    return await _secureStorage.read(key);
  }

  Future<bool> clearSession() async {
    final accessTokenKey = AppConstants.secureStorageKeys.accessToken;
    final refreshTokenKey = AppConstants.secureStorageKeys.refreshToken;
    final userSessionKey = AppConstants.secureStorageKeys.userSession;

    final isCleared = await Future.any([
      _secureStorage.delete(accessTokenKey),
      _secureStorage.delete(refreshTokenKey),
      _secureStorage.delete(userSessionKey)
    ]);

    return isCleared;
  }
}
