import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/core/common/interceptors.dart';
import 'package:flutter_boilerplate/core/common/network_info.dart';
import 'package:flutter_boilerplate/core/common/token_manager.dart';
import 'package:flutter_boilerplate/core/services/api_service.dart';
import 'package:flutter_boilerplate/core/services/app_database.dart';
import 'package:flutter_boilerplate/modules/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:flutter_boilerplate/modules/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:flutter_boilerplate/modules/auth/data/repositories/auth_repository.dart';
import 'package:flutter_boilerplate/modules/auth/presentation/controllers/auth_controller.dart';
import 'package:flutter_boilerplate/modules/connectivity/presentation/controllers/connectivity_controller.dart';
import 'package:flutter_boilerplate/modules/user/data/data_sources/local/db/user_dao.dart';
import 'package:flutter_boilerplate/modules/user/data/data_sources/local/user_local_data_source.dart';
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
    Get.put<Dio>(Dio());
    Get.put<AndroidOptions>(
        const AndroidOptions(encryptedSharedPreferences: true));
    Get.put<FlutterSecureStorage>(FlutterSecureStorage(aOptions: Get.find()));
    Get.put<Connectivity>(Connectivity());
    Get.put<ImagePicker>(ImagePicker());
    Get.put<DeviceInfoPlugin>(DeviceInfoPlugin());

    // Helpers
    Get.put<NetworkInfo>(NetworkInfo(Get.find()));
    Get.put<ApiService>(ApiService(Get.find()));
    Get.put<HeaderInterceptor>(HeaderInterceptor(Get.find()));
    Get.put<TokenManager>(TokenManager());

    // Dao's
    Get.put<UserDao>(appDatabase.userDao);

    // Data Sources
    Get.put<AuthRemoteDataSource>(AuthRemoteDataSource(Get.find()));
    Get.put<AuthLocalDataSource>(AuthLocalDataSource(Get.find(), Get.find()));
    Get.put<UserRemoteDataSource>(UserRemoteDataSource(Get.find()));
    Get.put<UserLocalDataSource>(UserLocalDataSource(Get.find()));

    // Repositories
    Get.put<AuthRepository>(AuthRepository(Get.find(), Get.find()));
    Get.put<UserRepository>(UserRepository(Get.find(), Get.find(), Get.find()));

    // Controllers
    Get.put<AuthController>(AuthController(Get.find()));
    Get.put<ConnectivityController>(ConnectivityController(Get.find()));
  }
}
