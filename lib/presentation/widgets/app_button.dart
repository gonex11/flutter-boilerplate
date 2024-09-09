import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/common/app_enums.dart';
import 'package:flutter_boilerplate/core/styles/app_typographies.dart';
import 'package:get/get.dart';

class AppButton extends StatelessWidget {
  final AppButtonType _type;
  final Function() onPressed;
  final String text;
  final bool isLoading;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
  }) : _type = AppButtonType.primary;

  const AppButton.outlined({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
  }) : _type = AppButtonType.outlined;

  @override
  Widget build(BuildContext context) {
    final appButtonTypeToWidget = {
      AppButtonType.primary: _defaultButton(context),
      AppButtonType.outlined: _outlinedButton(context),
    };

    return appButtonTypeToWidget[_type] ?? _defaultButton(context);
  }

  Widget _defaultButton(BuildContext context) {
    return SizedBox(
      width: context.mediaQuerySize.width,
      height: 45,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Visibility(
          visible: !isLoading,
          replacement: SizedBox(
            height: 18,
            width: 18,
            child: Center(
              child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ),
          ),
          child: Text(
            text,
            style: AppTypographies.mdSemiBold.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _outlinedButton(BuildContext context) {
    return SizedBox(
      width: context.mediaQuerySize.width,
      height: 45,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Visibility(
          visible: !isLoading,
          replacement: SizedBox(
            height: 18,
            width: 18,
            child: Center(
              child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ),
          ),
          child: Text(
            text,
            style: AppTypographies.mdSemiBold.copyWith(
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
