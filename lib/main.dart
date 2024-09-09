import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/utils/injection_util.dart';
import 'package:flutter_boilerplate/core/utils/utils.dart';
import 'package:get/get.dart';

import 'core/routes/page_routes.dart';

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
      getPages: PageRoutes.routes,
      initialRoute: PageRoutes.INITIAL,
      initialBinding: InjectionUtil(),
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
