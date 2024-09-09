import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/utils/utils.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/services/responses/error_detail_response.dart';
import 'package:flutter_boilerplate/data/models/user/user_model.dart';
import 'package:flutter_boilerplate/data/models/user/user_payload.dart';
import 'package:flutter_boilerplate/data/repositories/user_repository.dart';
import 'package:flutter_boilerplate/presentation/controllers/home/home_controller.dart';
import 'package:flutter_boilerplate/presentation/widgets/app_error_bottom_sheet.dart';
import 'package:get/get.dart';

class CreateUserController extends GetxController with StateMixin<UserModel> {
  final UserRepository _repository;

  CreateUserController(this._repository);

  @override
  void onInit() {
    change(null, status: RxStatus.empty());
    super.onInit();
  }

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

  final validationErrors = RxList<ErrorDetailResponse>([]);

  Future<void> createUser() async {
    change(null, status: RxStatus.loading());

    final payload = UserPayload(
      username: unameController.text,
      firstName: fNameController.text,
      lastName: lNameController.text,
      password: passController.text,
    );
    final result = await _repository.createUser(payload);
    result.fold((failure) {
      final error = failure.error;

      if (error?.type == 'validation_error') {
        validationErrors.value = failure.error?.errors ?? [];
        update();
      } else {
        final message = Utils.getErrorMessage(error?.errors) ?? "";
        Get.bottomSheet(AppErrorBottomSheet(message: message));
      }
    }, (data) async {
      Get.back();

      final HomeController homeController = Get.find();
      await homeController.getUsers();

      change(data, status: RxStatus.success());
    });
  }
}
