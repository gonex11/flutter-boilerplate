import 'package:flutter_boilerplate/core/middlewares/auth_middleware.dart';
import 'package:flutter_boilerplate/presentation/bindings/user_binding.dart';
import 'package:flutter_boilerplate/presentation/pages/create_user_page.dart';
import 'package:flutter_boilerplate/presentation/pages/login_page.dart';
import 'package:flutter_boilerplate/presentation/pages/user_detail_page.dart';
import 'package:get/get.dart';

import '../../presentation/bindings/home_binding.dart';
import '../../presentation/pages/home_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = AppRoutes.LOGIN;

  static final pages = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginPage(),
      binding: HomeBinding(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.USER,
      page: () => const UserDetailPage(),
      binding: UserBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_USER,
      page: () => const CreateUserPage(),
      binding: UserBinding(),
    ),
  ];
}
