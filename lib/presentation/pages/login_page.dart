import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/routes/app_pages.dart';
import 'package:flutter_boilerplate/core/styles/app_colors.dart';
import 'package:flutter_boilerplate/core/styles/app_fonts.dart';
import 'package:flutter_boilerplate/presentation/controllers/login_controller.dart';
import 'package:flutter_boilerplate/presentation/widgets/app_button.dart';
import 'package:flutter_boilerplate/presentation/widgets/app_input.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor:
            (context.isDarkMode) ? AppColors.darkBackground : AppColors.primary,
        body: SafeArea(
          top: false,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            child: SizedBox(
              height: context.mediaQuerySize.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Login',
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
                            'Pastikan akun anda telah terdaftar dalam aplikasi',
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
                                    'Username',
                                    style: AppFonts.mdSemiBold,
                                  ),
                                  const SizedBox(height: 8),
                                  AppInput(
                                    hintText: 'Username',
                                    onChanged: (value) {},
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 16),
                                  Text(
                                    'Password',
                                    style: AppFonts.mdSemiBold,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  AppInput.password(
                                    hintText: 'Password',
                                    onChanged: (value) {},
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              AppButton(
                                onPressed: () {
                                  Get.offAndToNamed(AppRoutes.HOME);
                                },
                                text: "Login",
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
    );
  }
}
