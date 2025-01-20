import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/styles/app_colors.dart';
import 'package:flutter_boilerplate/shared/styles/app_fonts.dart';
import 'package:flutter_boilerplate/shared/utils/app_enums.dart';
import 'package:get/get.dart';

class AppButton extends StatelessWidget {
  final AppButtonType _type;
  final String text;
  final double? height;
  final double? width;
  final Function()? onPressed;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final bool isLoading;
  final bool enabled;
  final double? radius;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.height,
    this.width,
    this.textColor,
    this.backgroundColor,
    this.enabled = true,
    this.radius,
  })  : _type = AppButtonType.primary,
        borderColor = null,
        borderWidth = null;

  const AppButton.outlined({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.height,
    this.width,
    this.textColor,
    this.borderWidth = 1,
    this.borderColor,
    this.enabled = true,
    this.radius,
  })  : _type = AppButtonType.outlined,
        backgroundColor = null;

  const AppButton.text({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.height,
    this.width,
    this.textColor,
    this.enabled = true,
    this.radius,
  })  : _type = AppButtonType.text,
        backgroundColor = null,
        borderColor = null,
        borderWidth = null;

  @override
  Widget build(BuildContext context) {
    return switch (_type) {
      AppButtonType.primary => _defaultButton(context),
      AppButtonType.outlined => _outlinedButton(context),
      AppButtonType.text => _textButton(context),
    };
  }

  Widget _defaultButton(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    return SizedBox(
      width: width ?? context.mediaQuerySize.width,
      height: height ?? 45,
      child: ElevatedButton(
        onPressed: (!enabled || isLoading) ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: enabled
              ? backgroundColor ?? colorScheme.primary
              : theme.disabledColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 12),
          ),
        ),
        child: Visibility(
          visible: !isLoading,
          replacement: SizedBox(
            height: 18,
            width: 18,
            child: Center(
              child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation(colorScheme.onPrimary),
              ),
            ),
          ),
          child: Text(
            text,
            style: AppFonts.mdSemiBold.copyWith(
              color: textColor ?? colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _outlinedButton(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    return SizedBox(
      width: width ?? context.mediaQuerySize.width,
      height: 45,
      child: OutlinedButton(
        onPressed: (!enabled || isLoading) ? null : onPressed,
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            color: borderColor ?? colorScheme.primary,
            width: borderWidth ?? 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 12),
          ),
          backgroundColor:
              enabled ? AppColors.transparent : theme.disabledColor,
        ),
        child: Visibility(
          visible: !isLoading,
          replacement: SizedBox(
            height: 18,
            width: 18,
            child: Center(
              child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation(colorScheme.onPrimary),
              ),
            ),
          ),
          child: Text(
            text,
            style: AppFonts.mdSemiBold.copyWith(
              color: textColor ?? colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _textButton(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    return SizedBox(
      width: width ?? context.mediaQuerySize.width,
      height: 45,
      child: TextButton(
        onPressed: (!enabled || isLoading) ? null : onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 12),
          ),
          backgroundColor:
              enabled ? AppColors.transparent : theme.disabledColor,
        ),
        child: Visibility(
          visible: !isLoading,
          replacement: SizedBox(
            height: 18,
            width: 18,
            child: Center(
              child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation(colorScheme.onPrimary),
              ),
            ),
          ),
          child: Text(
            text,
            style: AppFonts.mdSemiBold.copyWith(
              color: textColor ?? colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
