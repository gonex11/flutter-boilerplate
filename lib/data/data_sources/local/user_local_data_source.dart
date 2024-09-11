import 'package:flutter_boilerplate/core/common/exceptions.dart';
import 'package:flutter_boilerplate/data/data_sources/local/db/boxes/users_box.dart';
import 'package:flutter_boilerplate/data/models/user_model.dart';

class UserLocalDataSource {
  final UsersBox _userBox;

  const UserLocalDataSource(this._userBox);

  Future<int> cacheUsers(List<UserModel> users) async {
    try {
      final result = await Future.any([
        _userBox.insertCache(users.map((e) => e.toAdapter()).toList()),
      ]);
      return result;
    } catch (e) {
      throw CacheException(e.toString());
    }
  }

  Future<List<UserModel>> getCachedUsers() async {
    final result = await _userBox.getCacheUsers();
    return result?.map((e) => UserModel.fromAdapter(e)).toList() ?? [];
  }
}
