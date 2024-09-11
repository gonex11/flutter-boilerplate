import 'package:flutter_boilerplate/core/common/utils.dart';
import 'package:flutter_boilerplate/core/routes/app_pages.dart';
import 'package:flutter_boilerplate/data/models/user_model.dart';
import 'package:flutter_boilerplate/data/repositories/auth_repository.dart';
import 'package:flutter_boilerplate/data/repositories/user_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<List<UserModel>> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  HomeController(this._authRepository, this._userRepository);

  @override
  void onInit() {
    getCacheUsers();
    super.onInit();
  }

  Future<void> getUsers() async {
    change(null, status: RxStatus.loading());

    final result = await _userRepository.getUsers();
    result.fold((remoteFailure) {
      final message = Utils.getErrorMessage(remoteFailure.error?.errors);
      change(null, status: RxStatus.error(message));
    }, (data) {
      if (data.isEmpty) {
        change([], status: RxStatus.empty());
        return;
      }
      change(data, status: RxStatus.success());
    });
  }

  Future<void> getCacheUsers() async {
    change(null, status: RxStatus.loading());

    final cacheResult = await _userRepository.getCacheUsers();
    if (cacheResult.isEmpty) {
      await getUsers();
      return;
    }

    change(cacheResult, status: RxStatus.success());
  }

  Future<void> logout() async {
    final isLoggedOut = await _authRepository.logout();
    if (isLoggedOut) Get.offAllNamed(AppRoutes.LOGIN);
  }
}
