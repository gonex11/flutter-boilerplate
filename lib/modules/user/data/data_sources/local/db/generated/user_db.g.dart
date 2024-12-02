// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $UserDbBuilderContract {
  /// Adds migrations to the builder.
  $UserDbBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $UserDbBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<UserDb> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorUserDb {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $UserDbBuilderContract databaseBuilder(String name) =>
      _$UserDbBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $UserDbBuilderContract inMemoryDatabaseBuilder() =>
      _$UserDbBuilder(null);
}

class _$UserDbBuilder implements $UserDbBuilderContract {
  _$UserDbBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $UserDbBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $UserDbBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<UserDb> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$UserDb();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$UserDb extends UserDb {
  _$UserDb([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao? _userDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `users` (`id` INTEGER, `username` TEXT, `firstName` TEXT, `lastName` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userEntityInsertionAdapter = InsertionAdapter(
            database,
            'users',
            (UserEntity item) => <String, Object?>{
                  'id': item.id,
                  'username': item.username,
                  'firstName': item.firstName,
                  'lastName': item.lastName
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserEntity> _userEntityInsertionAdapter;

  @override
  Future<List<UserEntity>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM users',
        mapper: (Map<String, Object?> row) => UserEntity(
            id: row['id'] as int?,
            username: row['username'] as String?,
            firstName: row['firstName'] as String?,
            lastName: row['lastName'] as String?));
  }

  @override
  Future<void> insertAll(List<UserEntity> users) async {
    await _userEntityInsertionAdapter.insertList(
        users, OnConflictStrategy.replace);
  }
}
