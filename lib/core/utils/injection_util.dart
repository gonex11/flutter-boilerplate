import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/core/utils/interceptors_util.dart';
import 'package:flutter_boilerplate/core/utils/network_info.dart';
import 'package:flutter_boilerplate/data/data_sources/local/db/boxes/users_box.dart';
import 'package:flutter_boilerplate/data/data_sources/local/db/secure_storage.dart';
import 'package:flutter_boilerplate/data/data_sources/local/user_local_data_source.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/services/api_helper.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/services/dio_helper.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/user_remote_data_source.dart';
import 'package:flutter_boilerplate/data/repositories/user_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InjectionUtil extends Bindings {
  @override
  void dependencies() {
    // Repositories
    Get.lazyPut<UserRepository>(() => UserRepository(Get.find(), Get.find()));

    // Data Sources
    Get.lazyPut<UserRemoteDataSource>(() => UserRemoteDataSource(Get.find()));
    Get.lazyPut<UserLocalDataSource>(() => UserLocalDataSource(Get.find()));

    // Boxes
    Get.lazyPut<UsersBox>(() => UsersBox());

    // Helpers
    Get.lazyPut<ApiHelper>(() => ApiHelper(Get.find(), Get.find()));
    Get.lazyPut<NetworkInfo>(() => NetworkInfo(Get.find()));
    Get.lazyPut<SecureStorage>(() => SecureStorage(Get.find()));
    Get.lazyPut<DioHelper>(() => DioHelper(dio: Get.find()));
    Get.lazyPut<HeaderInterceptor>(() => HeaderInterceptor(Get.find()));

    // Externals
    Get.lazyPut<Dio>(() => Dio());
    Get.lazyPut<FlutterSecureStorage>(() {
      final androidOptions =
          const AndroidOptions(encryptedSharedPreferences: true);
      return FlutterSecureStorage(aOptions: androidOptions);
    });
    Get.lazyPut<InternetConnectionChecker>(() => InternetConnectionChecker());
  }
}
