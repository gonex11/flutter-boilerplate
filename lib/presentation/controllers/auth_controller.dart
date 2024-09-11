import 'package:flutter_boilerplate/core/routes/app_pages.dart';
import 'package:flutter_boilerplate/data/repositories/auth_repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepository _repository;

  AuthController(this._repository);

  @override
  void onInit() {
    authCheck();
    super.onInit();
  }

  final isAuthenticated = false.obs;

  Future<void> authCheck() async {
    final result = await _repository.getLoggedUser();
    result.fold((_) {
      Get.offAllNamed(AppRoutes.LOGIN);
    }, (data) {
      Get.offAllNamed(AppRoutes.HOME);
    });
  }
}
