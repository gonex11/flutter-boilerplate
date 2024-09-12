import 'package:flutter_boilerplate/core/common/app_constants.dart';
import 'package:flutter_boilerplate/data/models/user_type.dart';
import 'package:hive/hive.dart';

class UsersBox {
  static final Box<UserType> _box = Hive.box(
    AppConstants.boxNames.users,
  );

  Future<bool> insertCache(List<UserType> users) async {
    try {
      await _box.clear();
      await _box.addAll(users);
      return true;
    } catch (e) {
      return false;
    }
  }

  List<UserType>? getCacheUsers() {
    return _box.values.toList();
  }
}
