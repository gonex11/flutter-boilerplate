import 'package:flutter_boilerplate/data/data_sources/local/db/users_db.dart';
import 'package:flutter_boilerplate/data/models/user_model.dart';

class UserLocalDataSource {
  final UsersDb _userDb;

  const UserLocalDataSource(this._userDb);

  Future<bool> cacheUsers(List<UserModel> users) async {
    return _userDb.insertCacheUsers(users.map((e) => e.toAdapter()).toList());
  }

  Future<List<UserModel>> getCacheUsers() async {
    final result = await _userDb.getCacheUsers();
    return result.map((e) => UserModel.fromAdapter(e)).toList();
  }
}
