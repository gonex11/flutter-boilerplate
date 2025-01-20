import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/modules/user/data/models/user_model.dart';
import 'package:flutter_boilerplate/modules/user/data/repositories/user_repository.dart';
import 'package:flutter_boilerplate/shared/utils/alert_dialog_helper.dart';
import 'package:flutter_boilerplate/shared/utils/result_state/result_state.dart';
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

  final formKey = GlobalKey<FormState>();

  final unameController = TextEditingController();
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final passController = TextEditingController();

  final createState = Rx<ResultState<UserModel>>(const ResultState.initial());

  Future<void> addUser() async {
    AlertDialogHelper.showCreateUserSuccessDialog();

    // if (formKey.currentState?.validate() == false) return;
    // createState.value = const ResultState.loading();

    // final payload = UserPayload(
    //   username: unameController.text.trim(),
    //   firstName: fNameController.text.trim(),
    //   lastName: lNameController.text.trim(),
    //   password: passController.text.trim(),
    // );

    // final result = await _repository.addUser(payload);
    // result.fold((failure) {
    //   createState.value = const ResultState.failed();

    //   final message = AppUtils.getErrorMessage(failure.error?.errors) ?? '';
    //   if (Get.isBottomSheetOpen == false) {
    //     AppUtils.showBottomSheet(AppErrorBottomSheet(message: message));
    //   }
    // }, (data) {
    //   createState.value = ResultState.success(data);

    //   Get.back(result: true);
    //   AlertDialogHelper.showCreateUserSuccessDialog();
    // });
  }
}
