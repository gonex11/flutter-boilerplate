import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/common/utils.dart';
import 'package:flutter_boilerplate/data/models/error_detail_response.dart';
import 'package:flutter_boilerplate/data/models/user_payload.dart';
import 'package:flutter_boilerplate/data/repositories/user_repository.dart';
import 'package:flutter_boilerplate/presentation/controllers/home_controller.dart';
import 'package:flutter_boilerplate/presentation/widgets/app_error_bottom_sheet.dart';
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
  final validationErrors = RxList<ErrorDetailResponse>([]);

  Future<void> createUser() async {
    isLoading.value = true;

    final payload = UserPayload(
      username: unameController.text,
      firstName: fNameController.text,
      lastName: lNameController.text,
      password: passController.text,
    );

    final result = await _repository.createUser(payload);
    result.fold((failure) {
      isLoading.value = false;

      final error = failure.error;
      if (error?.type == 'validation_error') {
        validationErrors.value = failure.error?.errors ?? [];
      } else {
        final message = Utils.getErrorMessage(error?.errors) ?? '';
        Utils.showBottomSheet(AppErrorBottomSheet(message: message));
      }
    }, (data) async {
      isLoading.value = false;

      final HomeController homeController = Get.find();
      await homeController.getUsers();

      Get.back();
    });
  }
}
