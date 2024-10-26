import 'package:flutter_boilerplate/modules/user/data/data_sources/db/users_db.dart';
import 'package:flutter_boilerplate/modules/user/data/models/user_model.dart';

class UserLocalDataSource {
  final UsersDb _userDb;

  const UserLocalDataSource(this._userDb);

  Future<bool> cacheUsers(List<UserModel> users) async {
    return _userDb.insertCacheUsers(users.map((e) => e.toAdapter()).toList());
  }

  List<UserModel> getCacheUsers() {
    final result = _userDb.getCacheUsers();
    return result.map((e) => UserModel.fromAdapter(e)).toList();
  }
}
