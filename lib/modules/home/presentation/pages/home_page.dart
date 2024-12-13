import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/routes/app_pages.dart';
import 'package:flutter_boilerplate/modules/user/presentation/widgets/user_tile.dart';
import 'package:flutter_boilerplate/shared/utils/alert_dialog_helper.dart';
import 'package:flutter_boilerplate/shared/utils/app_fakes.dart';
import 'package:flutter_boilerplate/shared/utils/app_localizations.dart';
import 'package:flutter_boilerplate/shared/utils/app_utils.dart';
import 'package:flutter_boilerplate/shared/widgets/app_fill_layout.dart';
import 'package:flutter_boilerplate/shared/widgets/app_list_view.dart';
import 'package:flutter_boilerplate/shared/widgets/app_refresh_indicator.dart';
import 'package:flutter_boilerplate/shared/widgets/app_skeletonizer.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop && result == true) {
          controller.onRefresh();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(AppLocalizations.usersTitle),
          actions: [
            IconButton(
              onPressed: () => AlertDialogHelper.showLogoutDialog(
                onConfirm: controller.logout,
              ),
              icon: Icon(
                Icons.exit_to_app,
                color: colorScheme.error,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: colorScheme.primary,
          onPressed: () {
            Get.toNamed(AppRoutes.createUser);
          },
          child: Icon(
            Icons.add,
            color: colorScheme.onPrimary,
          ),
        ),
        body: SafeArea(
          child: AppRefreshIndicator(
            onRefresh: controller.onRefresh,
            child: Obx(
              () => controller.usersState.value.when(
                loading: () {
                  return AppSkeletonizer(
                    enabled: true,
                    child: AppListView(
                      padding: const EdgeInsets.all(16),
                      itemCount: AppFakes.list.users.length,
                      itemBuilder: (context, index) {
                        final user = AppFakes.list.users[index];
                        return UserTile(
                          onTap: null,
                          user: user,
                        );
                      },
                    ),
                  );
                },
                success: (data) {
                  return AppListView(
                    padding: const EdgeInsets.all(16),
                    itemCount: data.length,
                    onRefresh: controller.onRefresh,
                    onLoadMore: (page, limit) async {
                      controller.fetchUsers(page: page, limit: limit);
                    },
                    itemBuilder: (context, index) {
                      final user = data[index];
                      return UserTile(
                        onTap: () => Get.toNamed(
                          AppRoutes.user,
                          arguments: user.id,
                        ),
                        user: user,
                      );
                    },
                  );
                },
                failed: (error) {
                  final message = AppUtils.getErrorMessage(error?.errors) ?? '';
                  return AppFillLayout(
                    child: Text(message),
                  );
                },
                initial: () {
                  return const AppFillLayout(
                    child: Text('There is no Users yet.'),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
