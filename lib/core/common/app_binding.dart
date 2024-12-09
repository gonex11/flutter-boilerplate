import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/core/common/network_info.dart';
import 'package:flutter_boilerplate/core/common/token_manager.dart';
import 'package:flutter_boilerplate/core/services/api_client.dart';
import 'package:flutter_boilerplate/core/services/app_database.dart';
import 'package:flutter_boilerplate/modules/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:flutter_boilerplate/modules/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:flutter_boilerplate/modules/auth/data/data_sources/remote/services/auth_service.dart';
import 'package:flutter_boilerplate/modules/auth/data/repositories/auth_repository.dart';
import 'package:flutter_boilerplate/modules/auth/presentation/controllers/auth_controller.dart';
import 'package:flutter_boilerplate/modules/connectivity/presentation/controllers/connectivity_controller.dart';
import 'package:flutter_boilerplate/modules/user/data/data_sources/local/db/user_dao.dart';
import 'package:flutter_boilerplate/modules/user/data/data_sources/local/user_local_data_source.dart';
import 'package:flutter_boilerplate/modules/user/data/data_sources/remote/services/user_service.dart';
import 'package:flutter_boilerplate/modules/user/data/data_sources/remote/user_remote_data_source.dart';
import 'package:flutter_boilerplate/modules/user/data/repositories/user_repository.dart';
import 'package:flutter_boilerplate/shared/utils/app_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    final appDatabase = await $FloorAppDatabase
        .databaseBuilder(AppConstants.general.appDatabase)
        .build();

    // Externals
    Get.lazyPut<Dio>(() => ApiClient.getDio('http://10.0.2.2:3000'));
    Get.lazyPut<AndroidOptions>(
        () => const AndroidOptions(encryptedSharedPreferences: true));
    Get.lazyPut<FlutterSecureStorage>(
        () => FlutterSecureStorage(aOptions: Get.find()));
    Get.lazyPut<Connectivity>(() => Connectivity());
    Get.lazyPut<ImagePicker>(() => ImagePicker());
    Get.lazyPut<DeviceInfoPlugin>(() => DeviceInfoPlugin());

    // Helpers
    Get.lazyPut<NetworkInfo>(() => NetworkInfo(Get.find()));
    Get.lazyPut<TokenManager>(() => TokenManager());

    // Dao's
    Get.lazyPut<UserDao>(() => appDatabase.userDao);

    // Api Services
    Get.lazyPut<AuthService>(() => AuthService(Get.find()));
    Get.lazyPut<UserService>(() => UserService(Get.find()));

    // Data Sources
    Get.lazyPut<AuthRemoteDataSource>(() => AuthRemoteDataSource(Get.find()));
    Get.lazyPut<AuthLocalDataSource>(() => AuthLocalDataSource(Get.find()));
    Get.lazyPut<UserRemoteDataSource>(() => UserRemoteDataSource(Get.find()));
    Get.lazyPut<UserLocalDataSource>(() => UserLocalDataSource(Get.find()));

    // Repositories
    Get.put<AuthRepository>(AuthRepository(Get.find(), Get.find(), Get.find()));
    Get.put<UserRepository>(UserRepository(Get.find(), Get.find(), Get.find()));

    // Controllers
    Get.put<AuthController>(AuthController(Get.find()));
    Get.put<ConnectivityController>(ConnectivityController(Get.find()));
  }
}
