import 'dart:convert';

import 'package:flutter_boilerplate/core/common/app_constants.dart';
import 'package:flutter_boilerplate/core/common/token_manager.dart';
import 'package:flutter_boilerplate/data/models/token_model.dart';
import 'package:flutter_boilerplate/data/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthLocalDataSource {
  final FlutterSecureStorage _secureStorage;
  final TokenManager _tokenManager;

  AuthLocalDataSource(this._secureStorage, this._tokenManager);

  Future<bool> isTokenExpired() async {
    final key = AppConstants.secureStorageKeys.accessToken;
    final accessToken = await _secureStorage.read(key: key);

    if (accessToken == null) return false;
    return _tokenManager.isTokenExpired(accessToken);
  }

  Future<bool> setUserSession(UserModel user) async {
    try {
      await _secureStorage.write(
        key: AppConstants.secureStorageKeys.userSession,
        value: jsonEncode(user.toJson()),
      );
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<UserModel?> getUserSession() async {
    final result = await _secureStorage.read(
      key: AppConstants.secureStorageKeys.userSession,
    );

    if (result == null) return null;
    return UserModel.fromJson(jsonDecode(result));
  }

  Future<bool> setToken(TokenModel tokenResponse) async {
    try {
      final refreshTokenKey = AppConstants.secureStorageKeys.refreshToken;
      final accessTokenKey = AppConstants.secureStorageKeys.accessToken;

      await _secureStorage.write(
          key: refreshTokenKey, value: tokenResponse.refreshToken);
      await _secureStorage.write(
          key: accessTokenKey, value: tokenResponse.accessToken);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<String?> getAccessToken() async {
    final key = AppConstants.secureStorageKeys.accessToken;
    return await _secureStorage.read(key: key);
  }

  Future<String?> getRefreshToken() async {
    final key = AppConstants.secureStorageKeys.refreshToken;
    return await _secureStorage.read(key: key);
  }

  Future<bool> clearSession() async {
    try {
      final accessTokenKey = AppConstants.secureStorageKeys.accessToken;
      final refreshTokenKey = AppConstants.secureStorageKeys.refreshToken;
      final userSessionKey = AppConstants.secureStorageKeys.userSession;

      await _secureStorage.delete(key: accessTokenKey);
      await _secureStorage.delete(key: refreshTokenKey);
      await _secureStorage.delete(key: userSessionKey);

      return true;
    } catch (_) {
      return false;
    }
  }
}
