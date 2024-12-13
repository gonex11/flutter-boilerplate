import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/styles/app_colors.dart';
import 'package:flutter_boilerplate/shared/styles/app_fonts.dart';
import 'package:flutter_boilerplate/shared/utils/app_constants.dart';
import 'package:flutter_boilerplate/shared/utils/app_enums.dart';
import 'package:flutter_boilerplate/shared/utils/app_localizations.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class AlertDialogHelper {
  static void _showDialog({
    required CoolAlertType type,
    required String title,
    required String message,
    String? confirmBtnText,
    String? cancelBtnText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool showCancelBtn = false,
  }) {
    final typeToColor = {
      CoolAlertType.success: AppColors.success,
      CoolAlertType.info: AppColors.info,
      CoolAlertType.confirm: AppColors.info,
      CoolAlertType.warning: AppColors.warning,
      CoolAlertType.error: AppColors.error,
      CoolAlertType.loading: AppColors.grey,
    };
    final backgroundColor = typeToColor[type] ?? AppColors.grey;

    CoolAlert.show(
      context: Get.context!,
      type: type,
      confirmBtnText: confirmBtnText ?? AppLocalizations.ok,
      cancelBtnText: cancelBtnText ?? AppLocalizations.cancel,
      onConfirmBtnTap: onConfirm,
      onCancelBtnTap: onCancel,
      title: title,
      text: message,
      titleTextStyle: AppFonts.lgSemiBold,
      textTextStyle: AppFonts.mdRegular,
      showCancelBtn: showCancelBtn,
      backgroundColor: backgroundColor,
      autoCloseDuration:
          (type != CoolAlertType.confirm) ? const Duration(seconds: 2) : null,
    );
  }

  static void _showSuccessDialog({
    required String title,
    required String message,
  }) {
    _showDialog(
      type: CoolAlertType.success,
      title: title,
      message: message,
    );
  }

  static void _showConfirmDialog({
    required String title,
    required String message,
    String? confirmBtnText,
    String? cancelBtnText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    _showDialog(
      type: CoolAlertType.confirm,
      confirmBtnText: confirmBtnText ?? AppLocalizations.yes,
      cancelBtnText: cancelBtnText ?? AppLocalizations.cancel,
      title: title,
      message: message,
      onConfirm: onConfirm,
      onCancel: onCancel,
    );
  }

  static void showGalleryPermissionDialog() {
    final permission = AppPermissionAlertType.gallery.name.capitalize ?? '';
    final title = AppLocalizations.requestPermissionTitle(
      AppConstants.general.appName,
      permission,
    );

    _showConfirmDialog(
      confirmBtnText: AppLocalizations.yes,
      cancelBtnText: AppLocalizations.cancel,
      onConfirm: openAppSettings,
      title: title,
      message: AppLocalizations.permissionMessage,
    );
  }

  static void showCameraPermissionDialog() {
    final permission = AppPermissionAlertType.camera.name.capitalize ?? '';
    final title = AppLocalizations.requestPermissionTitle(
      AppConstants.general.appName,
      permission,
    );

    _showConfirmDialog(
      confirmBtnText: AppLocalizations.yes,
      cancelBtnText: AppLocalizations.cancel,
      onConfirm: openAppSettings,
      title: title,
      message: AppLocalizations.permissionMessage,
    );
  }

  static void showCreateUserSuccessDialog() {
    _showSuccessDialog(
      title: AppLocalizations.successTitle,
      message: AppLocalizations.createUserSuccessMessage,
    );
  }

  static void showLogoutDialog({required VoidCallback onConfirm}) {
    _showConfirmDialog(
      confirmBtnText: AppLocalizations.yes,
      cancelBtnText: AppLocalizations.cancel,
      title: AppLocalizations.logoutTitle,
      message: AppLocalizations.logoutMessage,
      onConfirm: onConfirm,
    );
  }
}
