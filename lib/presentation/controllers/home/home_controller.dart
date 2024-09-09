import 'package:flutter_boilerplate/core/common/failures.dart';
import 'package:flutter_boilerplate/core/common/utils.dart';
import 'package:flutter_boilerplate/data/models/user/user_model.dart';
import 'package:flutter_boilerplate/data/repositories/user_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<List<UserModel>> {
  final UserRepository _repository;

  HomeController(this._repository) {
    getCacheUsers();
  }

  Future<void> getUsers() async {
    change(null, status: RxStatus.loading());

    final result = await _repository.getUsers();
    result.fold((remoteFailure) {
      if (remoteFailure is NetworkFailure) {
        change(null, status: RxStatus.error());
        Utils.showNoInternetBottomSheet();
      } else {
        final message = Utils.getErrorMessage(remoteFailure.error?.errors);
        change(null, status: RxStatus.error(message));
      }
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

    final cacheResult = await _repository.getCacheUsers();
    cacheResult.fold((_) async {
      await getUsers();
    }, (data) async {
      if (data.isEmpty) {
        await getUsers();
        return;
      }
      change(data, status: RxStatus.success());
    });
  }
}
