import 'package:flutter_boilerplate/modules/auth/data/models/auth_validate_model.dart';
import 'package:flutter_boilerplate/modules/auth/data/repositories/auth_repository.dart';
import 'package:flutter_boilerplate/shared/utils/result_state.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepository _repository;

  AuthController(this._repository);

  @override
  Future<void> onInit() async {
    await authCheck();
    super.onInit();
  }

  final authState =
      Rx<ResultState<AuthValidateModel>>(const ResultState.initial());

  Future<void> authCheck() async {
    final result = await _repository.validateAuth();
    result.fold((_) {
      authState.value = const ResultState.failed();
    }, (data) {
      authState.value = ResultState.success(data);
    });
  }
}
