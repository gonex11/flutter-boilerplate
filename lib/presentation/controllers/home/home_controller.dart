import 'package:flutter_boilerplate/data/data_sources/remote/user_remote_data_source.dart';
import 'package:flutter_boilerplate/data/models/user/user_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<List<UserModel>> {
  final UserRemoteDataSource _remoteDataSource;

  HomeController(this._remoteDataSource) {
    getUsers();
  }

  Future<void> getUsers() async {
    change(null, status: RxStatus.loading());

    final result = await _remoteDataSource.getUsers();
    result.fold((failure) {
      final message = failure.error?.errors?.firstOrNull?.detail;
      change(null, status: RxStatus.error(message));
    }, (data) {
      change(data, status: RxStatus.success());
    });
  }
}
