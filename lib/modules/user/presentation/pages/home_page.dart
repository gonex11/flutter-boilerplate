import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/routes/app_pages.dart';
import 'package:flutter_boilerplate/modules/user/presentation/widgets/user_tile.dart';
import 'package:flutter_boilerplate/shared/utils/app_fakes.dart';
import 'package:flutter_boilerplate/shared/utils/app_localizations.dart';
import 'package:flutter_boilerplate/shared/utils/app_utils.dart';
import 'package:flutter_boilerplate/shared/widgets/app_refresh_layout.dart';
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
          controller.fetchUsers(true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(AppLocalizations.usersTitle),
          actions: [
            IconButton(
              onPressed: controller.logout,
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
          child: Obx(
            () => controller.usersState.value.when(
              loading: () {
                return AppSkeletonizer(
                  enabled: true,
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: AppFakes.list.users.length,
                    separatorBuilder: (_, __) {
                      return const SizedBox(height: 16);
                    },
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
                return RefreshIndicator.adaptive(
                  backgroundColor: colorScheme.surfaceBright,
                  color: colorScheme.primary,
                  onRefresh: () async {
                    controller.fetchUsers(true);
                  },
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    padding: const EdgeInsets.all(16),
                    itemCount: data.length,
                    separatorBuilder: (_, __) {
                      return const SizedBox(height: 16);
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
                  ),
                );
              },
              failed: (error) {
                final message = AppUtils.getErrorMessage(error?.errors) ?? '';
                return AppRefreshLayout(
                  onRefresh: controller.fetchUsers,
                  child: Text(message),
                );
              },
              initial: () {
                return AppRefreshLayout(
                  onRefresh: controller.fetchUsers,
                  child: const Text('There is no Users yet.'),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
