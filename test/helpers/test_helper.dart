import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/core/common/token_manager.dart';
import 'package:flutter_boilerplate/data/data_sources/local/auth_local_data_source.dart';
import 'package:flutter_boilerplate/data/data_sources/local/db/boxes/users_box.dart';
import 'package:flutter_boilerplate/data/data_sources/local/db/secure_storage.dart';
import 'package:flutter_boilerplate/data/data_sources/local/user_local_data_source.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/user_remote_data_source.dart';
import 'package:flutter_boilerplate/data/repositories/auth_repository.dart';
import 'package:flutter_boilerplate/data/repositories/user_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  AuthRepository,
  UserRepository,
  AuthRemoteDataSource,
  AuthLocalDataSource,
  UserRemoteDataSource,
  UserLocalDataSource,
  UsersBox,
  SecureStorage,
  TokenManager,
], customMocks: [
  MockSpec<Dio>(as: #MockDio)
])
void main() {}
