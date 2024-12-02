import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/modules/connectivity/presentation/controllers/connectivity_controller.dart';
import 'package:flutter_boilerplate/shared/styles/app_fonts.dart';
import 'package:flutter_boilerplate/shared/utils/app_constants.dart';
import 'package:flutter_boilerplate/shared/widgets/app_bottom_sheet.dart';
import 'package:get/get.dart';

class NoInternetBottomSheet extends StatelessWidget {
  const NoInternetBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    return GetBuilder<ConnectivityController>(
      builder: (controller) {
        return AppBottomSheet(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Column(
                children: [
                  Icon(
                    Icons.signal_wifi_statusbar_connected_no_internet_4_rounded,
                    color: colorScheme.primary,
                    size: 150,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppConstants.messages.networkErrorTitle,
                    textAlign: TextAlign.center,
                    style: AppFonts.xlBold.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppConstants.messages.networkErrorMessage,
                    textAlign: TextAlign.center,
                    style: AppFonts.mdRegular.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
