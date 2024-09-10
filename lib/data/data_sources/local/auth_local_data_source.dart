import 'package:flutter_boilerplate/core/common/app_constants.dart';
import 'package:flutter_boilerplate/data/data_sources/local/db/secure_storage.dart';

class AuthLocalDataSource {
  final SecureStorage _secureStorage;

  AuthLocalDataSource(this._secureStorage);

  Future<void> setAccessToken(String token) async {
    final key = AppConstants.secureStorageKeys.accessToken;
    return await _secureStorage.write(key, token);
  }

  Future<void> setRefreshToken(String token) async {
    final key = AppConstants.secureStorageKeys.refreshToken;
    return await _secureStorage.write(key, token);
  }

  Future<String?> getRefreshToken() async {
    final key = AppConstants.secureStorageKeys.refreshToken;
    return await _secureStorage.read(key);
  }

  Future<bool> clearToken() async {
    final accessTokenKey = AppConstants.secureStorageKeys.accessToken;
    final refreshTokenKey = AppConstants.secureStorageKeys.refreshToken;

    final isCleared = await Future.any([
      _secureStorage.delete(accessTokenKey),
      _secureStorage.delete(refreshTokenKey),
    ]);

    return isCleared;
  }
}
