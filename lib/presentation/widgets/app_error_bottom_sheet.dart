import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/presentation/widgets/app_bottom_sheet.dart';
import 'package:flutter_boilerplate/presentation/widgets/app_button.dart';
import 'package:get/get.dart';

class AppErrorBottomSheet extends StatelessWidget {
  final String message;

  const AppErrorBottomSheet({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    return AppBottomSheet(
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.warning_rounded,
              color: colorScheme.error,
              size: 150,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Get.textTheme.bodyLarge,
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: AppButton(
                onPressed: Get.back,
                text: 'OK',
              ),
            )
          ],
        ),
      ),
    );
  }
}
