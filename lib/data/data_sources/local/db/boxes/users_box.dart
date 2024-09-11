import 'package:flutter_boilerplate/core/common/app_constants.dart';
import 'package:flutter_boilerplate/data/models/user_type.dart';
import 'package:hive/hive.dart';

class UsersBox {
  static final Box<UserType> _box = Hive.box(
    AppConstants.boxNames.users,
  );

  Future<int> insertCache(List<UserType> users) async {
    final result = (await _box.addAll(users)).map((e) async => e);
    return await Future.any([
      _box.clear(),
      ...result,
    ]);
  }

  List<UserType>? getCacheUsers() {
    return _box.values.toList();
  }
}
