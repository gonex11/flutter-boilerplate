import 'package:flutter_boilerplate/presentation/bindings/user/user_binding.dart';
import 'package:flutter_boilerplate/presentation/pages/user/create_user_page.dart';
import 'package:flutter_boilerplate/presentation/pages/user/user_detail_page.dart';
import 'package:get/get.dart';

import '../../presentation/bindings/home/home_binding.dart';
import '../../presentation/pages/home/home_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = AppRoutes.HOME;

  static final pages = [
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
