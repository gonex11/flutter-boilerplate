abstract class AppConstants {
  AppConstants._();

  static final SecureStorageKeys _secureStorageKeys = SecureStorageKeys._();
  static SecureStorageKeys get secureStorageKeys => _secureStorageKeys;
}

class SecureStorageKeys {
  SecureStorageKeys._();

  String get accessToken => "accessToken";
  String get refreshToken => "refreshToken";
}
