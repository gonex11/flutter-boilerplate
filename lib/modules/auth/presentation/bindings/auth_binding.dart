import 'package:flutter_boilerplate/modules/auth/presentation/controllers/login_controller.dart';
import 'package:get/get.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(Get.find()));
  }
}
