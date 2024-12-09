import 'package:flutter_boilerplate/core/common/network_info.dart';
import 'package:flutter_boilerplate/core/common/token_manager.dart';
import 'package:flutter_boilerplate/modules/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:flutter_boilerplate/modules/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:flutter_boilerplate/modules/auth/data/data_sources/remote/services/auth_service.dart';
import 'package:flutter_boilerplate/modules/auth/data/repositories/auth_repository.dart';
import 'package:flutter_boilerplate/modules/user/data/data_sources/local/db/user_dao.dart';
import 'package:flutter_boilerplate/modules/user/data/data_sources/local/user_local_data_source.dart';
import 'package:flutter_boilerplate/modules/user/data/data_sources/remote/services/user_service.dart';
import 'package:flutter_boilerplate/modules/user/data/data_sources/remote/user_remote_data_source.dart';
import 'package:flutter_boilerplate/modules/user/data/repositories/user_repository.dart';
import 'package:flutter_boilerplate/modules/user/presentation/controllers/home_controller.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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

  // Dao's
  UserDao,

  // Api Services
  AuthService,
  UserService,

  // Others
  FlutterSecureStorage,
  TokenManager,
  NetworkInfo,
])
void main() {}
