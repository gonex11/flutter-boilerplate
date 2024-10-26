import 'package:flutter_boilerplate/modules/user/presentation/controllers/create_user_controller.dart';
import 'package:flutter_boilerplate/modules/user/presentation/controllers/user_controller.dart';
import 'package:get/get.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CreateUserController>(CreateUserController(Get.find()));
    Get.put<UserController>(UserController(Get.find()));
  }
}
