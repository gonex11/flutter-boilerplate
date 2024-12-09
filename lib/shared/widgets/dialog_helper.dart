import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/shared/widgets/app_permission_alert.dart';
import 'package:get/get.dart';

abstract class DialogHelper {
  static void _showDialog(Widget child) {
    Get.dialog(
      barrierDismissible: true,
      child,
    );
  }

  static void showGalleryPermissionDialog() {
    _showDialog(const AppPermissionAlert.gallery());
  }

  static void showCameraPermissionDialog() {
    _showDialog(const AppPermissionAlert.camera());
  }
}
