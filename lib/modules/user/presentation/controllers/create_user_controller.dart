import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/common/utils.dart';
import 'package:flutter_boilerplate/shared/responses/error_detail_response.dart';
import 'package:flutter_boilerplate/modules/user/data/models/user_payload.dart';
import 'package:flutter_boilerplate/modules/user/data/repositories/user_repository.dart';
import 'package:flutter_boilerplate/shared/components/app_error_bottom_sheet.dart';
import 'package:get/get.dart';

class CreateUserController extends GetxController {
  final UserRepository _repository;

  CreateUserController(this._repository);

  @override
  void dispose() {
    unameController.dispose();
    fNameController.dispose();
    lNameController.dispose();
    passController.dispose();
    super.dispose();
  }

  final TextEditingController unameController = TextEditingController();
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final isLoading = false.obs;
  final isUserCreated = false.obs;
  final validationErrors = RxList<ErrorDetailResponse>([]);

  Future<void> createUser(UserPayload payload) async {
    isLoading.value = true;

    final result = await _repository.createUser(payload);
    result.fold((failure) {
      isLoading.value = false;
      isUserCreated.value = false;

      final error = failure.error;
      if (error?.type == 'validation_error') {
        validationErrors.value = failure.error?.errors ?? [];
      } else {
        final message = Utils.getErrorMessage(error?.errors) ?? '';
        if (Get.isBottomSheetOpen == false) {
          Utils.showBottomSheet(AppErrorBottomSheet(message: message));
        }
      }
    }, (data) async {
      isLoading.value = false;
      isUserCreated.value = true;
      Get.back(result: true);
    });
  }
}
