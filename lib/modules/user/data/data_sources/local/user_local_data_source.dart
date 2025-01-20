import 'package:flutter_boilerplate/core/common/exceptions.dart';
import 'package:flutter_boilerplate/modules/user/data/data_sources/local/db/user_dao.dart';
import 'package:flutter_boilerplate/modules/user/data/models/user_model.dart';

class UserLocalDataSource {
  final UserDao _userDao;

  const UserLocalDataSource(this._userDao);

  Future<List<UserModel>> getCachedUsers() async {
    final result = await _userDao.getAll();
    return result.map((e) => UserModel.fromEntity(e)).toList();
  }

  Future<bool> cacheUsers(List<UserModel> users) async {
    try {
      await _userDao.insertAll(users.map((e) => e.toEntity()).toList());
      return true;
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
