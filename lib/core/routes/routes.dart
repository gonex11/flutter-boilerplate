part of 'page_routes.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const USER = _Paths.USER;
  static const CREATE_USER = _Paths.CREATE_USER;
}

abstract class _Paths {
  _Paths._();

  static const HOME = '/home';
  static const USER = '/user';
  static const CREATE_USER = '/user/create';
}
