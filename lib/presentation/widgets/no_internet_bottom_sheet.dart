import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/common/app_constants.dart';
import 'package:flutter_boilerplate/core/styles/app_typographies.dart';
import 'package:flutter_boilerplate/presentation/controllers/connectivity/connectivity_controller.dart';
import 'package:flutter_boilerplate/presentation/widgets/app_bottom_sheet.dart';
import 'package:flutter_boilerplate/presentation/widgets/app_button.dart';
import 'package:get/get.dart';

class NoInternetBottomSheet extends StatelessWidget {
  const NoInternetBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
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
                    color: Colors.blue,
                    size: 150,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppConstants.messages.networkErrorTitle,
                    textAlign: TextAlign.center,
                    style: AppTypographies.xlBold,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppConstants.messages.networkErrorMessage,
                    textAlign: TextAlign.center,
                    style: AppTypographies.mdRegular,
                  ),
                  const SizedBox(height: 24),
                  AppButton.outlined(
                    onPressed: () {},
                    text: 'Try Again',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
