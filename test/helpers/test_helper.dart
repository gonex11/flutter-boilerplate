import 'package:flutter_boilerplate/core/common/network_info.dart';
import 'package:flutter_boilerplate/core/common/token_manager.dart';
import 'package:flutter_boilerplate/core/services/api_service.dart';
import 'package:flutter_boilerplate/modules/auth/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_boilerplate/modules/user/data/data_sources/db/users_db.dart';
import 'package:flutter_boilerplate/modules/user/data/data_sources/user_local_data_source.dart';
import 'package:flutter_boilerplate/modules/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:flutter_boilerplate/modules/user/data/data_sources/user_remote_data_source.dart';
import 'package:flutter_boilerplate/modules/user/data/models/user_type.dart';
import 'package:flutter_boilerplate/modules/auth/data/repositories/auth_repository.dart';
import 'package:flutter_boilerplate/modules/user/data/repositories/user_repository.dart';
import 'package:flutter_boilerplate/modules/user/presentation/controllers/home_controller.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  // Controllers
  HomeController,

  // Repositories
  AuthRepository,
  UserRepository,

  // Data Sources
  AuthRemoteDataSource,
  AuthLocalDataSource,
  UserRemoteDataSource,
  UserLocalDataSource,

  // Databases
  UsersDb,

  // Others
  ApiService,
  FlutterSecureStorage,
  TokenManager,
  NetworkInfo,
], customMocks: [
  // Boxes
  MockSpec<Box<UserType>>(as: #MockUserTypeBox)
])
void main() {}
