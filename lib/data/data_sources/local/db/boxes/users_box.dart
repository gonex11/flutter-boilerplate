import 'package:flutter_boilerplate/core/utils/constants_util.dart';
import 'package:flutter_boilerplate/data/data_sources/local/db/adapters/user_type.dart';
import 'package:hive/hive.dart';

class UsersBox {
  static final Box<UserType> _box = Hive.box(
    ConstantsUtil.boxNames.users,
  );

  Future<void> insertCache(List<UserType> users) async {
    await _box.addAll(users);
  }

  List<UserType>? getCacheUsers() {
    return _box.values.toList();
  }

  Future<void> clearCache() async {
    await _box.clear();
  }
}
