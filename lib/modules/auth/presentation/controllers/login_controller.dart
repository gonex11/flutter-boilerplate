import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/core/routes/app_pages.dart';
import 'package:flutter_boilerplate/modules/auth/data/models/token_model.dart';
import 'package:flutter_boilerplate/modules/auth/data/repositories/auth_repository.dart';
import 'package:flutter_boilerplate/shared/utils/app_utils.dart';
import 'package:flutter_boilerplate/shared/utils/result_state.dart';
import 'package:flutter_boilerplate/shared/widgets/app_error_bottom_sheet.dart';
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

  final formKey = GlobalKey<FormState>();

  final unameController = TextEditingController();
  final passController = TextEditingController();

  final loginState = Rx<ResultState<TokenModel>>(const ResultState.initial());

  Future<void> login() async {
    if (formKey.currentState?.validate() == false) return;
    loginState.value = const ResultState.loading();

    final username = unameController.text.trim();
    final password = passController.text.trim();

    final result = await _repository.login(username, password);
    result.fold((failure) {
      loginState.value = const ResultState.failed();

      final message = AppUtils.getErrorMessage(failure.error?.errors) ?? '';
      if (Get.isBottomSheetOpen == false) {
        AppUtils.showBottomSheet(AppErrorBottomSheet(message: message));
      }
    }, (data) {
      loginState.value = ResultState.success(data);
      Get.offAndToNamed(AppRoutes.home);
    });
  }
}
