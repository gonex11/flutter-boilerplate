import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/core/common/utils.dart';
import 'package:flutter_boilerplate/core/routes/app_pages.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/services/responses/error_detail_response.dart';
import 'package:flutter_boilerplate/data/repositories/auth_repository.dart';
import 'package:flutter_boilerplate/presentation/widgets/app_error_bottom_sheet.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with StateMixin {
  final AuthRepository _repository;

  LoginController(this._repository);

  @override
  void onInit() {
    change(null, status: RxStatus.empty());
    super.onInit();
  }

  @override
  void dispose() {
    unameController.dispose();
    passController.dispose();
    super.dispose();
  }

  final TextEditingController unameController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final validationErrors = RxList<ErrorDetailResponse>([]);

  Future<void> login() async {
    final email = unameController.text;
    final password = passController.text;

    final result = await _repository.login(email, password);
    result.fold((failure) {
      final error = failure.error;

      if (error?.type == 'validation_error') {
        validationErrors.value = failure.error?.errors ?? [];
        update();
      } else {
        final message = Utils.getErrorMessage(error?.errors) ?? '';
        Utils.showBottomSheet(AppErrorBottomSheet(message: message));
      }
    }, (data) {
      Get.offAndToNamed(AppRoutes.LOGIN);
    });
  }
}