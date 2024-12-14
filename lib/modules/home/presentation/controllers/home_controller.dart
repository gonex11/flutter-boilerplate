import 'package:flutter_boilerplate/core/routes/app_pages.dart';
import 'package:flutter_boilerplate/modules/auth/data/repositories/auth_repository.dart';
import 'package:flutter_boilerplate/modules/user/data/models/user_model.dart';
import 'package:flutter_boilerplate/modules/user/data/repositories/user_repository.dart';
import 'package:flutter_boilerplate/shared/utils/result_state/result_state.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  HomeController(this._authRepository, this._userRepository);

  @override
  Future<void> onInit() async {
    await onRefresh();
    super.onInit();
  }

  int? _page = 1;
  final _limit = 10;

  final usersState =
      Rx<ResultState<List<UserModel>>>(const ResultState.initial());
  final logoutState = Rx<ResultState<bool>>(const ResultState.initial());

  Future<void> onRefresh() async {
    await fetchUsers(refresh: true);
  }

  Future<void> onLoadMore() async {
    await fetchUsers();
  }

  Future<void> fetchUsers({bool refresh = false}) async {
    _page = refresh ? 1 : _page;
    if (_page == null) return;

    if (_page == 1) {
      usersState.value = const ResultState.loading();
    }

    final result = await _userRepository.fetchUsers(page: _page, limit: _limit);
    result.fold((failure) {
      usersState.value = ResultState.failed(failure.error);
    }, (data) {
      _page = (data.length < _limit) ? null : _page! + 1;

      if (data.isEmpty) {
        if (refresh) {
          usersState.value = const ResultState.initial();
          return;
        }
        usersState.value = ResultState.success(data);
      } else {
        final currentState = usersState.value;
        usersState.value = ResultState.success(
          (currentState is ResultSuccess<List<UserModel>>)
              ? [...currentState.data, ...data]
              : data,
        );
      }
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
