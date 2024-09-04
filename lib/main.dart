import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/utils/app_injections.dart';
import 'package:get/get.dart';

import 'core/routes/app_pages.dart';

void main() async {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Flutter Boilerplate",
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
      initialBinding: AppInjections(),
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
