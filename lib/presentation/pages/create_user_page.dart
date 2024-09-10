import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/common/utils.dart';
import 'package:flutter_boilerplate/core/styles/app_fonts.dart';
import 'package:flutter_boilerplate/presentation/controllers/create_user_controller.dart';
import 'package:flutter_boilerplate/presentation/widgets/app_button.dart';
import 'package:flutter_boilerplate/presentation/widgets/app_input.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class CreateUserPage extends GetView<CreateUserController> {
  const CreateUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create User'),
        ),
        persistentFooterButtons: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: AppButton(
              isLoading: controller.status == RxStatus.loading(),
              onPressed: controller.createUser,
              text: 'Save',
            ),
          ),
        ],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Obx(
                  () {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Username',
                          style: AppFonts.mdRegular.copyWith(
                            color: colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 6),
                        AppInput(
                          controller: controller.unameController,
                          hintText: 'Enter your username',
                          error: Utils.getErrorMessage(
                            controller.validationErrors,
                            'username',
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'First Name',
                          style: AppFonts.mdRegular.copyWith(
                            color: colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 6),
                        AppInput(
                          controller: controller.fNameController,
                          hintText: 'Enter your first name',
                          error: Utils.getErrorMessage(
                            controller.validationErrors,
                            'first_name',
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Last Name',
                          style: AppFonts.mdRegular.copyWith(
                            color: colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 6),
                        AppInput(
                          controller: controller.lNameController,
                          hintText: 'Enter your last name',
                          error: Utils.getErrorMessage(
                            controller.validationErrors,
                            'last_name',
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Password',
                          style: AppFonts.mdRegular.copyWith(
                            color: colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 6),
                        AppInput.password(
                          controller: controller.passController,
                          hintText: 'Enter your password',
                          error: Utils.getErrorMessage(
                            controller.validationErrors,
                            'password',
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
