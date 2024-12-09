import 'package:flutter_boilerplate/modules/user/data/data_sources/remote/services/user_service.dart';
import 'package:flutter_boilerplate/modules/user/data/models/user_model.dart';
import 'package:flutter_boilerplate/modules/user/data/models/user_payload.dart';

class UserRemoteDataSource {
  final UserService _userService;

  const UserRemoteDataSource(this._userService);

  Future<List<UserModel>> fetchUsers() => _userService.fetchUsers();

  Future<UserModel> getUserById(int id) => _userService.getUserById(id);

  Future<UserModel> addUser(UserPayload payload) =>
      _userService.addUser(payload);
}
