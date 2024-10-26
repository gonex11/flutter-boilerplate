import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/core/common/app_binding.dart';
import 'package:flutter_boilerplate/core/common/app_constants.dart';
import 'package:flutter_boilerplate/shared/responses/error_detail_response.dart';
import 'package:flutter_boilerplate/modules/user/data/models/user_type.dart';
import 'package:flutter_boilerplate/modules/connectivity/presentation/widgets/no_internet_bottom_sheet.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class Utils {
  Utils._();

  static Future<void> initProject() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Hive.initFlutter();
    Hive.registerAdapter(UserTypeAdapter());

    await Future.any([
      Hive.openBox<UserType>(AppConstants.boxNames.users),
    ]);

    AppBinding().dependencies();
  }

  static void showBottomSheet(Widget child) {
    Get.bottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      child,
    );
  }

  static void showNoInternetBottomSheet() {
    Get.bottomSheet(
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      const NoInternetBottomSheet(
        key: ValueKey('noInternetBottomSheet'),
      ),
    );
  }

  static showDialog(Widget child) {
    Get.dialog(
      barrierDismissible: true,
      child,
    );
  }

  static String? getErrorMessage(List<ErrorDetailResponse>? errors,
      [String? attr]) {
    if (errors?.isEmpty == true) {
      return null;
    } else {
      final message = errors?.where((e) => e.attr == attr).firstOrNull?.detail;
      return message?.capitalize;
    }
  }
}
