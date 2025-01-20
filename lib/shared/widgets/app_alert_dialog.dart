import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/styles/app_colors.dart';
import 'package:flutter_boilerplate/shared/styles/app_fonts.dart';
import 'package:flutter_boilerplate/shared/utils/app_enums.dart';
import 'package:flutter_boilerplate/shared/utils/app_localizations.dart';
import 'package:flutter_boilerplate/shared/widgets/app_button.dart';
import 'package:get/get.dart';

class AppAlertDialog extends StatefulWidget {
  final AppAlertType type;
  final String? title;
  final String? text;
  final String? confirmBtnText;
  final String? cancelBtnText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final bool showCancelBtn;

  const AppAlertDialog({
    super.key,
    required this.type,
    this.title,
    this.text,
    this.confirmBtnText,
    this.cancelBtnText,
    this.onConfirm,
    this.onCancel,
    this.showCancelBtn = false,
  });

  @override
  State<AppAlertDialog> createState() => _AppAlertDialogState();
}

class _AppAlertDialogState extends State<AppAlertDialog> {
  @override
  void initState() {
    if (widget.type != AppAlertType.confirm &&
        widget.type != AppAlertType.loading) {
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          Get.back();
        }
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;

    final icon = switch (widget.type) {
      AppAlertType.success => Icons.check_circle_rounded,
      AppAlertType.info => Icons.info_rounded,
      AppAlertType.confirm => Icons.info_rounded,
      AppAlertType.warning => Icons.warning_rounded,
      AppAlertType.error => Icons.error_rounded,
      _ => Icons.info_rounded
    };

    final defaultTitle = switch (widget.type) {
      AppAlertType.success => AppLocalizations.success(),
      AppAlertType.info => AppLocalizations.info(),
      AppAlertType.confirm => AppLocalizations.confirm(),
      AppAlertType.warning => AppLocalizations.warning(),
      AppAlertType.error => AppLocalizations.error(),
      AppAlertType.loading => AppLocalizations.loading(),
    };

    final backgroundColor = switch (widget.type) {
      AppAlertType.success => AppColors.success,
      AppAlertType.info => AppColors.info,
      AppAlertType.confirm => AppColors.info,
      AppAlertType.warning => AppColors.warning,
      AppAlertType.error => AppColors.error,
      AppAlertType.loading => AppColors.grey,
    };

    return Dialog(
      backgroundColor: colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: context.mediaQuerySize.height * .13,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              color: backgroundColor,
            ),
            child: Center(
              child: Visibility(
                visible: widget.type != AppAlertType.loading,
                replacement: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(colorScheme.onPrimary),
                ),
                child: Icon(
                  icon,
                  color: colorScheme.onSurface,
                  size: 78,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.title ?? defaultTitle,
                  style: AppFonts.xlBold,
                ),
                Visibility(
                  visible: widget.text != null,
                  child: const SizedBox(height: 8),
                ),
                Visibility(
                  visible: widget.text != null,
                  child: Text(
                    widget.text ?? '',
                    style: AppFonts.mdSemiBold,
                  ),
                ),
                Visibility(
                  visible: widget.text != null,
                  child: const SizedBox(height: 24),
                ),
                Visibility(
                  visible: widget.type != AppAlertType.loading,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: widget.type == AppAlertType.confirm ||
                            widget.showCancelBtn,
                        child: Flexible(
                          child: AppButton.text(
                            radius: 50,
                            height: 38,
                            width: context.mediaQuerySize.width * .25,
                            onPressed: widget.onCancel ?? Get.back,
                            textColor: colorScheme.onSurface,
                            text: widget.cancelBtnText ??
                                AppLocalizations.cancel(),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: widget.type == AppAlertType.confirm ||
                            widget.showCancelBtn,
                        child: const SizedBox(width: 24),
                      ),
                      Flexible(
                        child: AppButton(
                          radius: 50,
                          height: 38,
                          width: context.mediaQuerySize.width * .25,
                          onPressed: widget.onConfirm,
                          backgroundColor: AppColors.success,
                          text: AppLocalizations.ok(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
