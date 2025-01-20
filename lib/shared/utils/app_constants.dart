import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class AppConstants {
  AppConstants._();

  static final General _general = General._();
  static General get general => _general;

  static final SecureStorageKeys _secureStorageKeys = SecureStorageKeys._();
  static SecureStorageKeys get secureStorageKeys => _secureStorageKeys;
}

class General {
  General._();

  String get appName => 'Flutter Boilerplate';
  String get idLocale => 'id';
  String get enLocale => 'en';
  String get appDatabase => 'app_database.db';

  String get baseUrl => dotenv.env['BASE_URL'] ?? '';
}

class SecureStorageKeys {
  SecureStorageKeys._();

  String get accessToken => 'access_token';
  String get refreshToken => 'refresh_token';
}
