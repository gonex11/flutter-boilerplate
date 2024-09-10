import 'package:flutter_boilerplate/data/models/user/user_model.dart';
import 'package:flutter_boilerplate/data/repositories/auth_repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController with StateMixin<UserModel> {
  final AuthRepository _repository;

  AuthController(this._repository) {
    authCheck();
  }

  @override
  void onInit() {
    change(null, status: RxStatus.empty());
    super.onInit();
  }

  Future<void> authCheck() async {
    final result = await _repository.getLoggedUser();
    result.fold((_) {
      change(null, status: RxStatus.error());
    }, (data) {
      change(data, status: RxStatus.success());
    });
  }
}
