import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/modules/auth/data/models/auth_validate_model.dart';
import 'package:flutter_boilerplate/modules/auth/presentation/controllers/auth_controller.dart';
import 'package:flutter_boilerplate/modules/connectivity/presentation/controllers/connectivity_controller.dart';
import 'package:flutter_boilerplate/shared/styles/app_themes.dart';
import 'package:flutter_boilerplate/shared/utils/app_constants.dart';
import 'package:flutter_boilerplate/shared/utils/app_translations.dart';
import 'package:flutter_boilerplate/shared/utils/app_utils.dart';
import 'package:flutter_boilerplate/shared/utils/bottom_sheet_helper.dart';
import 'package:flutter_boilerplate/shared/utils/result_state/result_state.dart';
import 'package:get/get.dart';

import 'core/routes/app_pages.dart';

void main() async {
  await AppUtils.initProject();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConnectivityController>(
      initState: (_) {
        final authState = Get.find<AuthController>().authState;

        final isConnected = Get.find<ConnectivityController>().isConnected;
        ever(isConnected, (value) {
          if (!value && Get.isBottomSheetOpen == false) {
            BottomSheetHelper.showNoInternetBottomSheet();
          } else if (value && Get.isBottomSheetOpen == true) {
            Get.back();
          }
        });

        ever(authState, (value) {
          if (value is ResultSuccess<AuthValidateModel>) {
            Get.offAllNamed(AppRoutes.home);
          } else {
            Get.offAllNamed(AppRoutes.login);
          }
        });
      },
      builder: (_) {
        return GetMaterialApp(
          title: 'Flutter Boilerplate',
          getPages: AppPages.pages,
          translations: AppTranslations(),
          locale: Get.deviceLocale,
          fallbackLocale: Locale(AppConstants.general.enLocale),
          initialRoute: AppPages.initial,
          themeMode: ThemeMode.system,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
        );
      },
    );
  }
}
