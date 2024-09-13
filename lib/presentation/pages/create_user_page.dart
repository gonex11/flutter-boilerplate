import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/common/app_localizations.dart';
import 'package:flutter_boilerplate/core/common/utils.dart';
import 'package:flutter_boilerplate/core/styles/app_fonts.dart';
import 'package:flutter_boilerplate/data/models/user_payload.dart';
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
            child: Obx(
              () => AppButton(
                isLoading: controller.isLoading.isTrue,
                onPressed: () {
                  final payload = UserPayload(
                    username: controller.unameController.text,
                    firstName: controller.fNameController.text,
                    lastName: controller.lNameController.text,
                    password: controller.passController.text,
                  );
                  controller.createUser(payload);
                },
                text: 'Save',
              ),
            ),
          ),
        ],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.username,
                      style: AppFonts.mdRegular.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Obx(
                      () => AppInput(
                        controller: controller.unameController,
                        hintText: AppLocalizations.usernamePlaceholder,
                        error: Utils.getErrorMessage(
                          controller.validationErrors,
                          'username',
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppLocalizations.firstName,
                      style: AppFonts.mdRegular.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Obx(
                      () => AppInput(
                        controller: controller.fNameController,
                        hintText: AppLocalizations.firstNamePlaceholder,
                        error: Utils.getErrorMessage(
                          controller.validationErrors,
                          'firstName',
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppLocalizations.lastName,
                      style: AppFonts.mdRegular.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Obx(
                      () => AppInput(
                        controller: controller.lNameController,
                        hintText: AppLocalizations.lastNamePlaceholder,
                        error: Utils.getErrorMessage(
                          controller.validationErrors,
                          'lastName',
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppLocalizations.password,
                      style: AppFonts.mdRegular.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Obx(
                      () => AppInput.password(
                        controller: controller.passController,
                        hintText: AppLocalizations.passwordPlaceholder,
                        error: Utils.getErrorMessage(
                          controller.validationErrors,
                          'password',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
