import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/core/common/interceptors.dart';
import 'package:flutter_boilerplate/core/common/network_info.dart';
import 'package:flutter_boilerplate/data/data_sources/local/auth_local_data_source.dart';
import 'package:flutter_boilerplate/data/data_sources/local/db/boxes/users_box.dart';
import 'package:flutter_boilerplate/data/data_sources/local/db/secure_storage.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/services/api_service.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/services/dio_service.dart';
import 'package:flutter_boilerplate/data/repositories/auth_repository.dart';
import 'package:flutter_boilerplate/presentation/controllers/auth_controller.dart';
import 'package:flutter_boilerplate/presentation/controllers/connectivity_controller.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class InjectionUtil extends Bindings {
  @override
  void dependencies() {
    // Externals
    Get.lazyPut<Dio>(() => Dio());
    Get.lazyPut<FlutterSecureStorage>(() {
      final androidOptions =
          const AndroidOptions(encryptedSharedPreferences: true);
      return FlutterSecureStorage(aOptions: androidOptions);
    });
    Get.lazyPut<Connectivity>(() => Connectivity());

    // Helpers
    Get.put<NetworkInfo>(NetworkInfo(Get.find()));
    Get.lazyPut<ApiService>(() => ApiService(Get.find(), Get.find()));
    Get.lazyPut<SecureStorage>(() => SecureStorage(Get.find()));
    Get.lazyPut<DioService>(() => DioService(dio: Get.find()));
    Get.lazyPut<HeaderInterceptor>(() => HeaderInterceptor(Get.find()));

    // Boxes
    Get.lazyPut<UsersBox>(() => UsersBox());

    // Data Sources
    Get.lazyPut<AuthRemoteDataSource>(() => AuthRemoteDataSource(Get.find()));
    Get.lazyPut<AuthLocalDataSource>(() => AuthLocalDataSource(Get.find()));

    // Repositories
    Get.lazyPut<AuthRepository>(() => AuthRepository(Get.find(), Get.find()));

    // Controllers
    Get.put<AuthController>(AuthController(Get.find()));
    Get.put<ConnectivityController>(ConnectivityController(Get.find()));
  }
}
