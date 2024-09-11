import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/core/routes/app_pages.dart';
import 'package:flutter_boilerplate/data/repositories/auth_repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepository _repository;

  AuthController(this._repository);

  final isAuthenticated = false.obs;

  @override
  void onInit() {
    authCheck();
    isAuthenticated.stream.listen((authenticated) {
      if (authenticated) {
        Get.offAllNamed(AppRoutes.HOME);
      } else {
        Get.offAllNamed(AppRoutes.LOGIN);
      }
    });

    super.onInit();
  }

  Future<void> authCheck() async {
    final result = await _repository.getLoggedUser();
    result.fold((_) {
      isAuthenticated.value = false;
      debugPrint("AUTH FAILURE: ${isAuthenticated.value}");
    }, (data) {
      isAuthenticated.value = true;
      debugPrint("AUTH SUCCESS: ${isAuthenticated.value}");
    });
  }
}
