import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/presentation/controllers/user/create_user_controller.dart';
import 'package:flutter_boilerplate/core/utils/utils.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class CreateUserView extends GetView<CreateUserController> {
  const CreateUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create user Page'),
        ),
        persistentFooterButtons: [
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: controller.createUser,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: (controller.status == RxStatus.empty)
                  ? SizedBox(
                      height: 15,
                      width: 15,
                      child: Center(
                        child: CircularProgressIndicator.adaptive(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                      ),
                    )
                  : const Text(
                      'Simpan',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
            ),
          ),
        ],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Obx(
                  () {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Username'),
                        const SizedBox(height: 6),
                        TextField(
                          controller: controller.unameController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'Enter your username',
                            errorText: Utils.getErrorMessage(
                              controller.validationErrors,
                              'username',
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text('First Name'),
                        const SizedBox(height: 6),
                        TextField(
                          controller: controller.fNameController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'Enter your first name',
                            errorText: Utils.getErrorMessage(
                              controller.validationErrors,
                              'first_name',
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text('Last Name'),
                        const SizedBox(height: 6),
                        TextField(
                          controller: controller.lNameController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'Enter your last name',
                            errorText: Utils.getErrorMessage(
                              controller.validationErrors,
                              'last_name',
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text('Password'),
                        const SizedBox(height: 6),
                        TextField(
                          controller: controller.passController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'Enter your password',
                            errorText: Utils.getErrorMessage(
                              controller.validationErrors,
                              'password',
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
