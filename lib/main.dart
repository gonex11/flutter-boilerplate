import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/modules/connectivity/presentation/controllers/connectivity_controller.dart';
import 'package:flutter_boilerplate/shared/styles/app_themes.dart';
import 'package:flutter_boilerplate/shared/utils/app_constants.dart';
import 'package:flutter_boilerplate/shared/utils/app_translations.dart';
import 'package:flutter_boilerplate/shared/utils/app_utils.dart';
import 'package:flutter_boilerplate/shared/widgets/bottom_sheet_helper.dart';
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
        final isConnected = Get.find<ConnectivityController>().isConnected;
        ever(isConnected, (value) {
          if (!value && Get.isBottomSheetOpen == false) {
            BottomSheetHelper.showNoInternetBottomSheet();
          } else if (value && Get.isBottomSheetOpen == true) {
            Get.back();
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
