import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/presentation/controllers/user/user_controller.dart';
import 'package:flutter_boilerplate/presentation/widgets/app_skeletonizer.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserDetailPage extends GetView<UserController> {
  const UserDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Detail Page'),
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
                    ),
                    const SizedBox(height: 6),
                    Text(
                      (controller.status == RxStatus.loading)
                          ? BoneMock.fullName
                          : '${user?.firstName} ${user?.lastName}',
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
