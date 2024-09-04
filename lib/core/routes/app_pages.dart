import 'package:flutter_boilerplate/presentation/bindings/user/user_binding.dart';
import 'package:flutter_boilerplate/presentation/views/user/create_user_view.dart';
import 'package:flutter_boilerplate/presentation/views/user/user_detail_view.dart';
import 'package:get/get.dart';

import '../../presentation/bindings/home/home_binding.dart';
import '../../presentation/views/home/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = AppRoutes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.USER,
      page: () => const UserDetailView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_USER,
      page: () => const CreateUserView(),
      binding: UserBinding(),
    ),
  ];
}
