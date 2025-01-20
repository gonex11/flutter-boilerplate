import 'package:flutter_boilerplate/modules/user/presentation/controllers/user_controller.dart';
import 'package:get/get.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController(Get.find()));
  }
}
