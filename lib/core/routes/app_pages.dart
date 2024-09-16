import 'package:flutter_boilerplate/presentation/bindings/login_binding.dart';
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

  static const initial = AppRoutes.home;

  static final pages = [
    GetPage(
      name: _Paths.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.user,
      page: () => const UserDetailPage(),
      binding: UserBinding(),
    ),
    GetPage(
      name: _Paths.createUser,
      page: () => const CreateUserPage(),
      binding: UserBinding(),
    ),
  ];
}
