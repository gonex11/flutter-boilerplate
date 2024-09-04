import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/presentation/widgets/app_bottom_sheet.dart';
import 'package:flutter_boilerplate/core/services/remote/responses/error_detail_response.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/user_remote_data_source.dart';
import 'package:flutter_boilerplate/data/models/user/user_model.dart';
import 'package:flutter_boilerplate/data/models/user/user_payload.dart';
import 'package:flutter_boilerplate/core/utils/utils.dart';
import 'package:get/get.dart';

class CreateUserController extends GetxController with StateMixin<UserModel> {
  final UserRemoteDataSource _remoteDataSource;

  CreateUserController(this._remoteDataSource);

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
    final result = await _remoteDataSource.createUser(payload);
    result.fold((failure) {
      final error = failure.error;

      if (error?.type == 'validation_error') {
        validationErrors.value = failure.error?.errors ?? [];
        update();
      } else {
        final message = Utils.getErrorMessage(error?.errors) ?? "";
        Get.bottomSheet(
          AppBottomSheet(
            child: Center(
              child: Column(
                children: [
                  Icon(
                    Icons.warning_rounded,
                    color: Colors.red,
                    size: 150,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: Get.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      }
    }, (data) {
      Get.back();
      change(data, status: RxStatus.success());
    });
  }
}
