import 'package:flutter_boilerplate/data/models/user_type.dart';
import 'package:hive/hive.dart';

class UsersDb {
  final Box<UserType> _box;

  const UsersDb(this._box);

  Future<bool> insertCacheUsers(List<UserType> users) async {
    final isCached = await Future.any([
      _box.clear(),
      ...(await _box.addAll(users)).map((e) async => e),
    ]);
    return isCached == 1;
  }

  List<UserType> getCacheUsers() {
    return _box.values.toList();
  }
}
