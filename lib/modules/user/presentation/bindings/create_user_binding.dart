import 'package:flutter_boilerplate/modules/user/presentation/controllers/create_user_controller.dart';
import 'package:get/get.dart';

class CreateUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateUserController>(() => CreateUserController(Get.find()));
  }
}
