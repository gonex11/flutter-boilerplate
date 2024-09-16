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
  Future<void> onInit() async {
    await getUsers();
    super.onInit();
  }

  final isLoggedOut = false.obs;

  Future<void> getUsers([bool refresh = false]) async {
    change(null, status: RxStatus.loading());

    final cacheResult =
        (refresh) ? <UserModel>[] : _userRepository.getCacheUsers();
    if (cacheResult.isEmpty) {
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
      return;
    }

    change(cacheResult, status: RxStatus.success());
  }

  Future<void> logout() async {
    isLoggedOut.value = await _authRepository.logout();
    if (isLoggedOut.isTrue) Get.offAllNamed(AppRoutes.login);
  }
}
