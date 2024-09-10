import 'package:flutter/src/widgets/navigator.dart';
import 'package:flutter_boilerplate/core/routes/app_pages.dart';
import 'package:flutter_boilerplate/presentation/controllers/auth_controller.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 0;

  @override
  RouteSettings? redirect(String? route) {
    final authController = Get.find<AuthController>();

    if (authController.state != null) {
      return const RouteSettings(name: AppRoutes.HOME);
    } else {
      return const RouteSettings(name: AppRoutes.LOGIN);
    }
  }
}
