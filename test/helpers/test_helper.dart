import 'package:flutter_boilerplate/core/common/network_info.dart';
import 'package:flutter_boilerplate/core/common/token_manager.dart';
import 'package:flutter_boilerplate/core/services/api_service.dart';
import 'package:flutter_boilerplate/data/data_sources/local/auth_local_data_source.dart';
import 'package:flutter_boilerplate/data/data_sources/local/db/users_db.dart';
import 'package:flutter_boilerplate/data/data_sources/local/user_local_data_source.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/user_remote_data_source.dart';
import 'package:flutter_boilerplate/data/models/user_type.dart';
import 'package:flutter_boilerplate/data/repositories/auth_repository.dart';
import 'package:flutter_boilerplate/data/repositories/user_repository.dart';
import 'package:flutter_boilerplate/presentation/controllers/home_controller.dart';
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
