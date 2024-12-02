import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/styles/app_fonts.dart';
import 'package:flutter_boilerplate/shared/utils/app_constants.dart';
import 'package:flutter_boilerplate/shared/utils/app_enums.dart';
import 'package:flutter_boilerplate/shared/utils/app_localizations.dart';
import 'package:flutter_boilerplate/shared/widgets/app_button.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class AppPermissionAlert extends StatelessWidget {
  final AppPermissionAlertType _type;

  const AppPermissionAlert.microphone({super.key})
      : _type = AppPermissionAlertType.microphone;

  const AppPermissionAlert.gallery({super.key})
      : _type = AppPermissionAlertType.gallery;

  const AppPermissionAlert.camera({super.key})
      : _type = AppPermissionAlertType.camera;

  @override
  Widget build(BuildContext context) {
    final theme = Get.theme;
    final colorScheme = theme.colorScheme;

    final permissionType = _getTypePermission(_type);
    final title = AppLocalizations.requestPermissionTitle(
      AppConstants.general.appName,
      permissionType,
    );

    return SimpleDialog(
      backgroundColor: colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: AppFonts.xlBold.copyWith(
          color: colorScheme.onPrimary,
        ),
      ),
      contentPadding: const EdgeInsets.all(16),
      children: [
        Text(
          AppLocalizations.permissionMessage,
          textAlign: TextAlign.center,
          style: AppFonts.mdRegular.copyWith(
            color: colorScheme.onPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: AppButton.outlined(
                text: AppLocalizations.cancel,
                onPressed: Get.back,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: AppButton(
                text: AppLocalizations.openSetting,
                onPressed: () {
                  openAppSettings();
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _getTypePermission(AppPermissionAlertType typePermission) {
    final typeToPermissionType = {
      AppPermissionAlertType.gallery: AppLocalizations.gallery,
      AppPermissionAlertType.camera: AppLocalizations.camera,
      AppPermissionAlertType.microphone: AppLocalizations.microphone,
    };

    return typeToPermissionType[typePermission] ?? "-";
  }
}
