import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_boilerplate/modules/user/data/data_sources/local/db/user_dao.dart';
import 'package:flutter_boilerplate/modules/user/data/data_sources/local/entities/user_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'generated/user_db.g.dart';

@Database(version: 1, entities: [UserEntity])
abstract class UserDb extends FloorDatabase {
  UserDao get userDao;
}
