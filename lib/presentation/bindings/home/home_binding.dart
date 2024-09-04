import 'package:flutter_boilerplate/data/data_sources/remote/user_remote_data_source.dart';
import 'package:get/get.dart';

import '../../controllers/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRemoteDataSource>(() => UserRemoteDataSource(Get.find()));
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
  }
}
