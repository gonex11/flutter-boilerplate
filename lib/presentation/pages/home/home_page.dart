import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/common/app_fakes.dart';
import 'package:flutter_boilerplate/core/routes/app_pages.dart';
import 'package:flutter_boilerplate/presentation/widgets/app_refresh_layout.dart';
import 'package:flutter_boilerplate/presentation/widgets/app_skeletonizer.dart';
import 'package:flutter_boilerplate/presentation/widgets/user_tile.dart';
import 'package:get/get.dart';

import '../../controllers/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorScheme.primary,
        onPressed: () {
          Get.toNamed(AppRoutes.CREATE_USER);
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
              padding: EdgeInsets.all(16),
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
              onRefresh: controller.getUsers,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                padding: EdgeInsets.all(16),
                itemCount: users?.length ?? 0,
                separatorBuilder: (_, __) {
                  return const SizedBox(height: 16);
                },
                itemBuilder: (context, index) {
                  final user = users?[index];
                  return UserTile(
                    onTap: () {
                      Get.toNamed(AppRoutes.USER, arguments: user?.id);
                    },
                    user: user,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
