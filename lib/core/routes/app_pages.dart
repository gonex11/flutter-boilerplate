import 'package:flutter_boilerplate/modules/auth/presentation/bindings/auth_binding.dart';
import 'package:flutter_boilerplate/modules/auth/presentation/pages/login_page.dart';
import 'package:flutter_boilerplate/modules/user/presentation/bindings/create_user_binding.dart';
import 'package:flutter_boilerplate/modules/user/presentation/bindings/user_binding.dart';
import 'package:flutter_boilerplate/modules/user/presentation/pages/create_user_page.dart';
import 'package:flutter_boilerplate/modules/user/presentation/pages/user_detail_page.dart';
import 'package:get/get.dart';

import '../../modules/home/presentation/bindings/home_binding.dart';
import '../../modules/home/presentation/pages/home_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = AppRoutes.home;

  static final pages = [
    GetPage(
      name: _Paths.login,
      page: () => const LoginPage(),
      binding: AuthBinding(),
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
      binding: CreateUserBinding(),
    ),
  ];
}
