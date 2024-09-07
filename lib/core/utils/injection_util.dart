import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/core/services/remote/helpers/dio_helper.dart';
import 'package:flutter_boilerplate/core/utils/interceptors_util.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class InjectionUtil extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Dio>(() => Dio());
    Get.lazyPut<DioHelper>(() => DioHelper(dio: Get.find()));
    Get.lazyPut<FlutterSecureStorage>(() {
      final androidOptions =
          const AndroidOptions(encryptedSharedPreferences: true);
      return FlutterSecureStorage(aOptions: androidOptions);
    });
    Get.lazyPut<HeaderInterceptor>(() => HeaderInterceptor(Get.find()));
  }
}
