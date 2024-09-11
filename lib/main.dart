import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/common/app_binding.dart';
import 'package:flutter_boilerplate/core/common/utils.dart';
import 'package:flutter_boilerplate/core/styles/app_themes.dart';
import 'package:get/get.dart';

import 'core/routes/app_pages.dart';

void main() async {
  await Utils.initProject();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Boilerplate',
      getPages: AppPages.pages,
      initialRoute: AppPages.INITIAL,
      initialBinding: AppBinding(),
      themeMode: ThemeMode.system,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
    );
  }
}
