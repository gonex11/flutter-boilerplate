import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/core/common/exceptions.dart';
import 'package:flutter_boilerplate/core/common/failures.dart';
import 'package:flutter_boilerplate/core/common/network_info.dart';
import 'package:flutter_boilerplate/modules/user/data/data_sources/local/user_local_data_source.dart';
import 'package:flutter_boilerplate/modules/user/data/data_sources/remote/user_remote_data_source.dart';
import 'package:flutter_boilerplate/modules/user/data/models/user_model.dart';
import 'package:flutter_boilerplate/modules/user/data/models/user_payload.dart';

class UserRepository {
  final UserRemoteDataSource _remoteDataSource;
  final UserLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  const UserRepository(
    this._remoteDataSource,
    this._localDataSource,
    this._networkInfo,
  );

  Future<Either<Failure, List<UserModel>>> fetchUsers({
    int? page,
    int limit = 10,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        final result =
            await _remoteDataSource.fetchUsers(page: page, limit: limit);
        _localDataSource.cacheUsers(result.data!);
        return Right(result.data!);
      } on ApiException catch (e) {
        return Left(ServerFailure(e.error));
      }
    } else {
      try {
        final result = await _localDataSource.getCachedUsers();
        return Right(result);
      } on DatabaseException catch (e) {
        return Left(CacheFailure(e.message));
      }
    }
  }

  Future<Either<Failure, UserModel>> getUserById(int id) async {
    try {
      final result = await _remoteDataSource.getUserById(id);
      return Right(result.data!);
    } on ApiException catch (e) {
      return Left(ServerFailure(e.error));
    }
  }

  Future<Either<Failure, UserModel>> addUser(UserPayload payload) async {
    try {
      final result = await _remoteDataSource.addUser(payload);
      return Right(result.data!);
    } on ApiException catch (e) {
      return Left(ServerFailure(e.error));
    }
  }
}
