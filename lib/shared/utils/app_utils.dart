import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/core/common/app_binding.dart';
import 'package:flutter_boilerplate/modules/connectivity/presentation/widgets/no_internet_bottom_sheet.dart';
import 'package:flutter_boilerplate/shared/responses/error_detail_response.dart';
import 'package:get/get.dart';

abstract class AppUtils {
  AppUtils._();

  static Future<void> initProject() async {
    WidgetsFlutterBinding.ensureInitialized();
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
