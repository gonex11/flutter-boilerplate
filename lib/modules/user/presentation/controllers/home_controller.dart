import 'package:flutter_boilerplate/core/routes/app_pages.dart';
import 'package:flutter_boilerplate/modules/auth/data/repositories/auth_repository.dart';
import 'package:flutter_boilerplate/modules/user/data/models/user_model.dart';
import 'package:flutter_boilerplate/modules/user/data/repositories/user_repository.dart';
import 'package:flutter_boilerplate/shared/utils/result_state.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  HomeController(this._authRepository, this._userRepository);

  @override
  Future<void> onInit() async {
    await getUsers();
    super.onInit();
  }

  final usersState =
      Rx<ResultState<List<UserModel>>>(const ResultState.initial());
  final logoutState = Rx<ResultState<bool>>(const ResultState.initial());

  Future<void> getUsers([bool refresh = false]) async {
    usersState.value = const ResultState.loading();

    final result = await _userRepository.getUsers();
    result.fold((failure) {
      usersState.value = ResultState.failed(failure.error);
    }, (data) {
      if (data.isEmpty) {
        usersState.value = const ResultState.initial();
        return;
      }
      usersState.value = ResultState.success(data);
    });
  }

  Future<void> logout() async {
    logoutState.value = const ResultState.loading();

    final isLoggedOut = await _authRepository.logout();
    if (isLoggedOut) {
      logoutState.value = ResultState.success(isLoggedOut);
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
