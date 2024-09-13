import 'package:flutter_boilerplate/core/common/network_info.dart';
import 'package:flutter_boilerplate/core/common/token_manager.dart';
import 'package:flutter_boilerplate/data/data_sources/local/auth_local_data_source.dart';
import 'package:flutter_boilerplate/data/data_sources/local/db/boxes/users_box.dart';
import 'package:flutter_boilerplate/data/data_sources/local/user_local_data_source.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/services/api_service.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/user_remote_data_source.dart';
import 'package:flutter_boilerplate/data/repositories/auth_repository.dart';
import 'package:flutter_boilerplate/data/repositories/user_repository.dart';
import 'package:flutter_boilerplate/presentation/controllers/connectivity_controller.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  // Controllers
  ConnectivityController,

  // Repositories
  AuthRepository,
  UserRepository,

  // Data Sources
  AuthRemoteDataSource,
  AuthLocalDataSource,
  UserRemoteDataSource,
  UserLocalDataSource,

  // Boxes
  UsersBox,

  // Others
  ApiService,
  FlutterSecureStorage,
  TokenManager,
  NetworkInfo,
])
void main() {}
