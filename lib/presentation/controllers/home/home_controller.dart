import 'package:flutter_boilerplate/data/models/user/user_model.dart';
import 'package:flutter_boilerplate/data/repositories/user_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<List<UserModel>> {
  final UserRepository _repository;

  HomeController(this._repository) {
    getUsers();
  }

  Future<void> getUsers() async {
    change(null, status: RxStatus.loading());

    final result = await _repository.getUsers();
    result.fold((failure) {
      final message = failure.error?.errors?.firstOrNull?.detail;
      change(null, status: RxStatus.error(message));
    }, (data) {
      change(data, status: RxStatus.success());
    });
  }
}
