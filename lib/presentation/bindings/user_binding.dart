import 'package:flutter_boilerplate/presentation/controllers/create_user_controller.dart';
import 'package:flutter_boilerplate/presentation/controllers/user_controller.dart';
import 'package:get/get.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateUserController>(() => CreateUserController(Get.find()));
    Get.lazyPut<UserController>(() => UserController(Get.find()));
  }
}
