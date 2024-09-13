import 'package:flutter_boilerplate/core/routes/app_pages.dart';
import 'package:flutter_boilerplate/data/repositories/auth_repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepository _repository;

  AuthController(this._repository);

  @override
  Future<void> onInit() async {
    await authCheck();
    super.onInit();
  }

  final isAuthenticated = false.obs;

  Future<void> authCheck() async {
    final result = await _repository.getLoggedUser();
    result.fold((_) {
      isAuthenticated.value = false;
      Get.offAllNamed(AppRoutes.LOGIN);
    }, (data) {
      isAuthenticated.value = true;
      Get.offAllNamed(AppRoutes.HOME);
    });
  }
}
