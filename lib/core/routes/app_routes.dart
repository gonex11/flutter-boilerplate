part of 'app_pages.dart';

abstract class AppRoutes {
  AppRoutes._();

  static const home = _Paths.home;
  static const user = _Paths.user;
  static const createUser = _Paths.createUser;
  static const login = _Paths.login;
}

abstract class _Paths {
  _Paths._();

  static const home = '/';
  static const user = '/user';
  static const createUser = '/user/create';
  static const login = '/login';
}
