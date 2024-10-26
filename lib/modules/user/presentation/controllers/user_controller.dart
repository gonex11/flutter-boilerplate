import 'package:flutter_boilerplate/core/common/utils.dart';
import 'package:flutter_boilerplate/modules/user/data/models/user_model.dart';
import 'package:flutter_boilerplate/modules/user/data/repositories/user_repository.dart';
import 'package:get/get.dart';

class UserController extends GetxController with StateMixin<UserModel> {
  final UserRepository _repository;

  UserController(this._repository);

  @override
  Future<void> onInit() async {
    await getUserById();
    super.onInit();
  }

  int id = Get.arguments ?? 0;

  Future<void> getUserById() async {
    change(null, status: RxStatus.loading());

    final result = await _repository.getUserById(id);
    result.fold((failure) {
      final error = failure.error;
      final message = Utils.getErrorMessage(error?.errors) ?? '';
      change(null, status: RxStatus.error(message));
    }, (data) {
      change(data, status: RxStatus.success());
    });
  }
}
