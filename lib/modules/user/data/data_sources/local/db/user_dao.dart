import 'package:floor/floor.dart';
import 'package:flutter_boilerplate/modules/user/data/data_sources/local/entities/user_entity.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM users')
  Future<List<UserEntity>> getAll();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAll(List<UserEntity> users);
}
