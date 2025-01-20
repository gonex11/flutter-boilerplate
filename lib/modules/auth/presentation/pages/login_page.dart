import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/modules/auth/presentation/controllers/login_controller.dart';
import 'package:flutter_boilerplate/shared/styles/app_colors.dart';
import 'package:flutter_boilerplate/shared/styles/app_fonts.dart';
import 'package:flutter_boilerplate/shared/utils/app_localizations.dart';
import 'package:flutter_boilerplate/shared/utils/app_utils.dart';
import 'package:flutter_boilerplate/shared/utils/result_state/result_state.dart';
import 'package:flutter_boilerplate/shared/widgets/app_button.dart';
import 'package:flutter_boilerplate/shared/widgets/app_input.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    return KeyboardDismisser(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor:
            (context.isDarkMode) ? AppColors.darkBackground : AppColors.primary,
        body: SafeArea(
          top: false,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: context.mediaQuerySize.height,
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        AppLocalizations.login(),
                        style: AppFonts.xlBold.copyWith(
                          fontSize: 32,
                          color: colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: colorScheme.surfaceBright,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              AppLocalizations.loginSubtitle(),
                              style: AppFonts.smRegular.copyWith(
                                color: AppColors.grey,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.username(),
                                      style: AppFonts.mdSemiBold,
                                    ),
                                    const SizedBox(height: 8),
                                    AppInput(
                                      controller: controller.unameController,
                                      hintText: AppLocalizations
                                          .usernamePlaceholder(),
                                      validator:
                                          FormBuilderValidators.required(),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 16),
                                    Text(
                                      AppLocalizations.password(),
                                      style: AppFonts.mdSemiBold,
                                    ),
                                    const SizedBox(height: 8),
                                    AppInput.password(
                                      controller: controller.passController,
                                      hintText: AppLocalizations
                                          .passwordPlaceholder(),
                                      validator: AppUtils.passwordValidator(),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Obx(
                                  () => AppButton(
                                    isLoading: controller.loginState.value
                                        is ResultLoading,
                                    onPressed: controller.login,
                                    text: AppLocalizations.login(),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
