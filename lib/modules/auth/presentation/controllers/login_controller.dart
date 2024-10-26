import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/core/common/utils.dart';
import 'package:flutter_boilerplate/core/routes/app_pages.dart';
import 'package:flutter_boilerplate/modules/auth/data/repositories/auth_repository.dart';
import 'package:flutter_boilerplate/shared/components/app_error_bottom_sheet.dart';
import 'package:flutter_boilerplate/shared/responses/error_detail_response.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthRepository _repository;

  LoginController(this._repository);

  @override
  void dispose() {
    unameController.dispose();
    passController.dispose();
    super.dispose();
  }

  final TextEditingController unameController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final isLoading = false.obs;
  final isLoggedIn = false.obs;
  final validationErrors = RxList<ErrorDetailResponse>([]);

  Future<void> login(String username, String password) async {
    isLoading.value = true;

    final result = await _repository.login(username, password);
    result.fold((failure) {
      isLoading.value = false;
      isLoggedIn.value = false;

      final error = failure.error;
      if (error?.type == 'validation_error') {
        validationErrors.value = failure.error?.errors ?? [];
      } else {
        final message = Utils.getErrorMessage(error?.errors) ?? '';
        if (Get.isBottomSheetOpen == false) {
          Utils.showBottomSheet(AppErrorBottomSheet(message: message));
        }
      }
    }, (data) {
      isLoading.value = false;
      isLoggedIn.value = true;
      Get.offAndToNamed(AppRoutes.home);
    });
  }
}
