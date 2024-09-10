import 'package:flutter_boilerplate/data/data_sources/local/user_local_data_source.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/user_remote_data_source.dart';
import 'package:flutter_boilerplate/data/repositories/user_repository.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Data Sources
    Get.lazyPut<UserRemoteDataSource>(() => UserRemoteDataSource(Get.find()));
    Get.lazyPut<UserLocalDataSource>(() => UserLocalDataSource(Get.find()));

    // Repositories
    Get.lazyPut<UserRepository>(() => UserRepository(Get.find(), Get.find()));

    // Controllers
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
  }
}
