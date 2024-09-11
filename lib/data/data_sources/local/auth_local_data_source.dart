import 'dart:convert';

import 'package:flutter_boilerplate/core/common/app_constants.dart';
import 'package:flutter_boilerplate/core/common/token_manager.dart';
import 'package:flutter_boilerplate/data/data_sources/local/db/secure_storage.dart';
import 'package:flutter_boilerplate/data/models/token_model.dart';
import 'package:flutter_boilerplate/data/models/user_model.dart';

class AuthLocalDataSource {
  final SecureStorage _secureStorage;
  final TokenManager _tokenManager;

  AuthLocalDataSource(this._secureStorage, this._tokenManager);

  Future<bool> isTokenExpired() async {
    final key = AppConstants.secureStorageKeys.accessToken;
    final accessToken = await _secureStorage.read(key);

    if (accessToken == null) return false;
    return _tokenManager.isTokenExpired(accessToken);
  }

  Future<bool> setUserSession(UserModel user) async {
    return await _secureStorage.write(
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

  Future<bool> setToken(TokenModel tokenResponse) async {
    final refreshTokenKey = AppConstants.secureStorageKeys.refreshToken;
    final accessTokenKey = AppConstants.secureStorageKeys.accessToken;

    return await Future.any([
      _secureStorage.write(refreshTokenKey, tokenResponse.refreshToken),
      _secureStorage.write(accessTokenKey, tokenResponse.accessToken),
    ]);
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
