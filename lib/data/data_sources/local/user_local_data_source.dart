import 'package:flutter_boilerplate/core/utils/constants_util.dart';
import 'package:flutter_boilerplate/core/utils/exception_util.dart';
import 'package:flutter_boilerplate/data/data_sources/local/db/boxes/users_box.dart';
import 'package:flutter_boilerplate/data/models/user/user_model.dart';

class UserLocalDataSource {
  final UsersBox _userBox;

  const UserLocalDataSource(this._userBox);

  Future<void> cacheUsers(List<UserModel> users) async {
    await _userBox.clearCache();
    await _userBox.insertCache(users.map((e) => e.toAdapter()).toList());
  }

  Future<List<UserModel>> getCachedUsers() async {
    final result = await _userBox.getCacheUsers();

    if (result != null && result.isNotEmpty) {
      return result.map((e) => UserModel.fromAdapter(e)).toList();
    } else {
      throw CacheException(ConstantsUtil.messages.cacheErrorMessage);
    }
  }
}
