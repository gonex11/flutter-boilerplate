import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/modules/user/presentation/controllers/user_controller.dart';
import 'package:flutter_boilerplate/shared/styles/app_fonts.dart';
import 'package:flutter_boilerplate/shared/utils/app_localizations.dart';
import 'package:flutter_boilerplate/shared/utils/result_state.dart';
import 'package:flutter_boilerplate/shared/widgets/app_skeletonizer.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserDetailPage extends GetView<UserController> {
  const UserDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.userDetail),
      ),
      body: SafeArea(
        child: Center(
          child: controller.userState.value.whenOrNull(
            success: (data) {
              final isLoading = controller.userState.value is ResultLoading;
              return AppSkeletonizer(
                enabled: isLoading,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      (isLoading) ? BoneMock.fullName : data.username ?? '-',
                      style: AppFonts.lgSemiBold.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      (isLoading)
                          ? BoneMock.fullName
                          : '${data.firstName} ${data.lastName}',
                      style: AppFonts.mdRegular.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
