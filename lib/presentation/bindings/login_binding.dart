import 'package:flutter_boilerplate/presentation/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController(Get.find()));
  }
}
