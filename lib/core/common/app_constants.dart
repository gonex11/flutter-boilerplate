abstract class AppConstants {
  AppConstants._();

  static final Messages _messages = Messages._();
  static Messages get messages => _messages;

  static final BoxNames _boxNames = BoxNames._();
  static BoxNames get boxNames => _boxNames;

  static final SecureStorageKeys _secureStorageKeys = SecureStorageKeys._();
  static SecureStorageKeys get secureStorageKeys => _secureStorageKeys;
}

class Messages {
  Messages._();

  String get cacheErrorMessage => "Can't get cache data";
  String get networkErrorTitle => "No internet connection...";
  String get networkErrorMessage =>
      "Please check your internet connection and try again.";
}

class BoxNames {
  BoxNames._();

  String get users => "users_box";
}

class SecureStorageKeys {
  SecureStorageKeys._();

  String get accessToken => "access_token";
  String get refreshToken => "refresh_token";
}
