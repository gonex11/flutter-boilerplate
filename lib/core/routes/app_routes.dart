part of 'app_pages.dart';

abstract class AppRoutes {
  AppRoutes._();

  static const HOME = _Paths.HOME;
  static const USER = _Paths.USER;
  static const CREATE_USER = _Paths.CREATE_USER;
  static const LOGIN = _Paths.LOGIN;
}

abstract class _Paths {
  _Paths._();

  static const HOME = '/';
  static const USER = '/user';
  static const CREATE_USER = '/user/create';
  static const LOGIN = '/login';
}
