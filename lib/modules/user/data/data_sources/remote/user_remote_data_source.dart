import 'package:flutter_boilerplate/modules/user/data/data_sources/remote/services/user_service.dart';
import 'package:flutter_boilerplate/modules/user/data/models/user_model.dart';
import 'package:flutter_boilerplate/modules/user/data/models/user_payload.dart';
import 'package:flutter_boilerplate/shared/responses/base_response.dart';

class UserRemoteDataSource {
  final UserService _userService;

  const UserRemoteDataSource(this._userService);

  Future<BaseResponse<List<UserModel>>> fetchUsers({
    int? page,
    int limit = 10,
  }) =>
      _userService.fetchUsers(page, limit);

  Future<BaseResponse<UserModel>> getUserById(int id) =>
      _userService.getUserById(id);

  Future<BaseResponse<UserModel>> addUser(UserPayload payload) =>
      _userService.addUser(payload);
}
