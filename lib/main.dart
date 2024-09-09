import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/common/app_injections.dart';
import 'package:flutter_boilerplate/core/common/utils.dart';
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
      title: "Flutter Boilerplate",
      getPages: AppPages.pages,
      initialRoute: AppPages.INITIAL,
      initialBinding: InjectionUtil(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ElevatedButton.styleFrom(
            side: BorderSide(
              color: Colors.blue,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
