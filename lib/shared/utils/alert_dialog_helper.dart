import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/utils/app_constants.dart';
import 'package:flutter_boilerplate/shared/utils/app_enums.dart';
import 'package:flutter_boilerplate/shared/utils/app_localizations.dart';
import 'package:flutter_boilerplate/shared/widgets/app_alert_dialog.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class AlertDialogHelper {
  static Future<dynamic> _showDialog({
    required AppAlertType type,
    required String title,
    required String message,
    String? confirmBtnText,
    String? cancelBtnText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool showCancelBtn = false,
  }) {
    return Get.dialog(
      AppAlertDialog(
        type: type,
        title: title,
        text: message,
        confirmBtnText: confirmBtnText,
        cancelBtnText: cancelBtnText,
        onConfirm: onConfirm,
        onCancel: onCancel,
        showCancelBtn: showCancelBtn,
      ),
    );
  }

  static Future<dynamic> _showSuccessDialog({
    required String title,
    required String message,
  }) {
    return _showDialog(
      type: AppAlertType.success,
      title: title,
      message: message,
    );
  }

  static Future<dynamic> _showConfirmDialog({
    required String title,
    required String message,
    String? confirmBtnText,
    String? cancelBtnText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return _showDialog(
      type: AppAlertType.confirm,
      confirmBtnText: confirmBtnText ?? AppLocalizations.yes(),
      cancelBtnText: cancelBtnText ?? AppLocalizations.cancel(),
      title: title,
      message: message,
      onConfirm: onConfirm,
      onCancel: onCancel,
    );
  }

  static Future<dynamic> showGalleryPermissionDialog() {
    final permission = AppPermissionAlertType.gallery.name.capitalize ?? '';
    final title = AppLocalizations.requestPermissionTitle(
      AppConstants.general.appName,
      permission,
    );

    return _showConfirmDialog(
      confirmBtnText: AppLocalizations.yes(),
      cancelBtnText: AppLocalizations.cancel(),
      onConfirm: openAppSettings,
      title: title,
      message: AppLocalizations.permissionMessage(),
    );
  }

  static Future<dynamic> showCameraPermissionDialog() {
    final permission = AppPermissionAlertType.camera.name.capitalize ?? '';
    final title = AppLocalizations.requestPermissionTitle(
      AppConstants.general.appName,
      permission,
    );

    return _showConfirmDialog(
      confirmBtnText: AppLocalizations.yes(),
      cancelBtnText: AppLocalizations.cancel(),
      onConfirm: openAppSettings,
      title: title,
      message: AppLocalizations.permissionMessage(),
    );
  }

  static Future<dynamic> showCreateUserSuccessDialog() {
    return _showSuccessDialog(
      title: AppLocalizations.successTitle(),
      message: AppLocalizations.createUserSuccessMessage(),
    );
  }

  static Future<dynamic> showLogoutDialog({required VoidCallback onConfirm}) {
    return _showConfirmDialog(
      confirmBtnText: AppLocalizations.yes(),
      cancelBtnText: AppLocalizations.cancel(),
      title: AppLocalizations.logoutTitle(),
      message: AppLocalizations.logoutMessage(),
      onConfirm: onConfirm,
    );
  }
}
