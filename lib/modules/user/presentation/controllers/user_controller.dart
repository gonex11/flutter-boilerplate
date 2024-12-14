import 'package:flutter_boilerplate/modules/user/data/models/user_model.dart';
import 'package:flutter_boilerplate/modules/user/data/repositories/user_repository.dart';
import 'package:flutter_boilerplate/shared/utils/result_state/result_state.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserRepository _repository;

  UserController(this._repository);

  @override
  Future<void> onInit() async {
    await getUserById();
    super.onInit();
  }

  int id = Get.arguments ?? 0;

  final userState = Rx<ResultState<UserModel>>(const ResultState.initial());

  Future<void> getUserById() async {
    userState.value = const ResultState.loading();

    final result = await _repository.getUserById(id);
    result.fold((failure) {
      userState.value = ResultState.failed(failure.error);
    }, (data) {
      userState.value = ResultState.success(data);
    });
  }
}
