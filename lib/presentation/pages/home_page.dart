import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/common/app_fakes.dart';
import 'package:flutter_boilerplate/core/common/app_localizations.dart';
import 'package:flutter_boilerplate/core/routes/app_pages.dart';
import 'package:flutter_boilerplate/presentation/widgets/app_refresh_layout.dart';
import 'package:flutter_boilerplate/presentation/widgets/app_skeletonizer.dart';
import 'package:flutter_boilerplate/presentation/widgets/user_tile.dart';
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
          controller.getUsers(true);
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
          child: controller.obx(
            onLoading: AppSkeletonizer(
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
            ),
            onEmpty: AppRefreshLayout(
              onRefresh: controller.getUsers,
              child: const Text('There is no Users yet.'),
            ),
            onError: (error) {
              return AppRefreshLayout(
                onRefresh: controller.getUsers,
                child: Text(error ?? ''),
              );
            },
            (users) {
              return RefreshIndicator.adaptive(
                backgroundColor: colorScheme.surfaceBright,
                color: colorScheme.primary,
                onRefresh: () async {
                  controller.getUsers(true);
                },
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  padding: const EdgeInsets.all(16),
                  itemCount: users?.length ?? 0,
                  separatorBuilder: (_, __) {
                    return const SizedBox(height: 16);
                  },
                  itemBuilder: (context, index) {
                    final user = users?[index];
                    return UserTile(
                      onTap: () {
                        Get.toNamed(AppRoutes.user, arguments: user?.id);
                      },
                      user: user,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
