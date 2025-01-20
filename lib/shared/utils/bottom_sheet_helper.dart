import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/modules/connectivity/presentation/widgets/no_internet_bottom_sheet.dart';
import 'package:get/get.dart';

abstract class BottomSheetHelper {
  static void _showBottomSheet(
    Widget child, {
    bool enableDrag = true,
    bool isDismissible = true,
  }) {
    Get.bottomSheet(
      enableDrag: enableDrag,
      isDismissible: isDismissible,
      isScrollControlled: true,
      child,
    );
  }

  static void showNoInternetBottomSheet() {
    _showBottomSheet(
      enableDrag: false,
      isDismissible: false,
      const NoInternetBottomSheet(),
    );
  }
}
