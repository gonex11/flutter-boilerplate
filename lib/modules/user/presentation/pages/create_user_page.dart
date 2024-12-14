import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/modules/user/presentation/controllers/create_user_controller.dart';
import 'package:flutter_boilerplate/modules/home/presentation/controllers/home_controller.dart';
import 'package:flutter_boilerplate/shared/styles/app_fonts.dart';
import 'package:flutter_boilerplate/shared/utils/app_localizations.dart';
import 'package:flutter_boilerplate/shared/utils/app_utils.dart';
import 'package:flutter_boilerplate/shared/utils/result_state/result_state.dart';
import 'package:flutter_boilerplate/shared/widgets/app_button.dart';
import 'package:flutter_boilerplate/shared/widgets/app_input.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class CreateUserPage extends GetView<CreateUserController> {
  const CreateUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop && result == true) {
          final homeController = Get.find<HomeController>();
          homeController.onRefresh();
        }
      },
      child: KeyboardDismisser(
        child: Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.addUser),
          ),
          persistentFooterButtons: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Obx(
                () => AppButton(
                  isLoading: controller.createState.value is ResultLoading,
                  onPressed: controller.addUser,
                  text: AppLocalizations.save,
                ),
              ),
            ),
          ],
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: controller.formKey,
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
                        AppInput(
                          controller: controller.unameController,
                          hintText: AppLocalizations.usernamePlaceholder,
                          validator: FormBuilderValidators.required(),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          AppLocalizations.firstName,
                          style: AppFonts.mdRegular.copyWith(
                            color: colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 6),
                        AppInput(
                          controller: controller.fNameController,
                          hintText: AppLocalizations.firstNamePlaceholder,
                          validator: FormBuilderValidators.required(),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          AppLocalizations.lastName,
                          style: AppFonts.mdRegular.copyWith(
                            color: colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 6),
                        AppInput(
                          controller: controller.lNameController,
                          hintText: AppLocalizations.lastNamePlaceholder,
                          validator: FormBuilderValidators.required(),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          AppLocalizations.password,
                          style: AppFonts.mdRegular.copyWith(
                            color: colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 6),
                        AppInput.password(
                          controller: controller.passController,
                          hintText: AppLocalizations.passwordPlaceholder,
                          validator: AppUtils.passwordValidator(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
