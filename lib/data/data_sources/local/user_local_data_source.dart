import 'package:flutter_boilerplate/data/data_sources/local/db/boxes/users_box.dart';
import 'package:flutter_boilerplate/data/models/user_model.dart';

class UserLocalDataSource {
  final UsersBox _userBox;

  const UserLocalDataSource(this._userBox);

  Future<bool> cacheUsers(List<UserModel> users) async {
    return _userBox.insertCache(users.map((e) => e.toAdapter()).toList());
  }

  Future<List<UserModel>> getCacheUsers() async {
    final result = await _userBox.getCacheUsers();
    return result?.map((e) => UserModel.fromAdapter(e)).toList() ?? [];
  }
}
