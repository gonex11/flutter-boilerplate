abstract class AppConstants {
  AppConstants._();

  static final General _general = General._();
  static General get general => _general;

  static final Messages _messages = Messages._();
  static Messages get messages => _messages;

  static final SecureStorageKeys _secureStorageKeys = SecureStorageKeys._();
  static SecureStorageKeys get secureStorageKeys => _secureStorageKeys;
}

class General {
  General._();

  String get appName => 'Flutter Boilerplate';
  String get idLocale => 'id';
  String get enLocale => 'en';
  String get appDatabase => 'app_database.db';
}

class Messages {
  Messages._();

  String get cacheErrorMessage => 'Can\'t get cache data';
  String get networkErrorTitle => 'No internet connection...';
  String get networkErrorMessage =>
      'Please check your internet connection and try again.';
}

class SecureStorageKeys {
  SecureStorageKeys._();

  String get accessToken => 'access_token';
  String get refreshToken => 'refresh_token';

  String get userSession => 'user_session';
}
