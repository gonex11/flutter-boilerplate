import 'package:flutter_boilerplate/data/data_sources/remote/user_remote_data_source.dart';
import 'package:flutter_boilerplate/data/models/user/user_model.dart';
import 'package:flutter_boilerplate/core/utils/utils.dart';
import 'package:get/get.dart';

class UserController extends GetxController with StateMixin<UserModel> {
  final UserRemoteDataSource _remoteDataSource;

  UserController(this._remoteDataSource) {
    _getUserById();
  }

  final id = Get.arguments ?? 0;

  Future<void> _getUserById() async {
    change(null, status: RxStatus.loading());

    final result = await _remoteDataSource.getUserById(id);
    result.fold((failure) {
      final error = failure.error;
      final message = Utils.getErrorMessage(error?.errors) ?? "";
      change(null, status: RxStatus.error(message));
    }, (data) {
      change(data, status: RxStatus.success());
    });
  }
}
