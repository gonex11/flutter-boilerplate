import 'package:flutter_boilerplate/modules/auth/data/models/token_model.dart';
import 'package:flutter_boilerplate/shared/utils/app_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthLocalDataSource {
  final FlutterSecureStorage _secureStorage;

  AuthLocalDataSource(this._secureStorage);

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
      await _secureStorage.deleteAll();
      return true;
    } catch (_) {
      return false;
    }
  }
}
