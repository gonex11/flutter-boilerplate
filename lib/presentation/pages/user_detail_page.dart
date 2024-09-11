import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/common/app_localizations.dart';
import 'package:flutter_boilerplate/core/styles/app_fonts.dart';
import 'package:flutter_boilerplate/presentation/controllers/user_controller.dart';
import 'package:flutter_boilerplate/presentation/widgets/app_skeletonizer.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserDetailPage extends GetView<UserController> {
  const UserDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.userDetail),
      ),
      body: SafeArea(
        child: Center(
          child: controller.obx(
            (user) {
              return AppSkeletonizer(
                enabled: controller.status == RxStatus.loading,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      (controller.status == RxStatus.loading)
                          ? BoneMock.fullName
                          : user?.username ?? '-',
                      style: AppFonts.lgSemiBold.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      (controller.status == RxStatus.loading)
                          ? BoneMock.fullName
                          : '${user?.firstName} ${user?.lastName}',
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
