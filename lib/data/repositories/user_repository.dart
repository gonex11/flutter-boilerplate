import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/core/common/exceptions.dart';
import 'package:flutter_boilerplate/core/common/failures.dart';
import 'package:flutter_boilerplate/data/data_sources/local/user_local_data_source.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/user_remote_data_source.dart';
import 'package:flutter_boilerplate/data/models/user_model.dart';
import 'package:flutter_boilerplate/data/models/user_payload.dart';

class UserRepository {
  final UserRemoteDataSource _remoteDataSource;
  final UserLocalDataSource _localDataSource;

  const UserRepository(this._remoteDataSource, this._localDataSource);

  Future<Either<Failure, List<UserModel>>> getUsers() async {
    try {
      final result = await _remoteDataSource.getUsers();
      await _localDataSource.cacheUsers(result);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ServerFailure(e.error));
    }
  }

  List<UserModel> getCacheUsers() {
    final result = _localDataSource.getCacheUsers();
    return result;
  }

  Future<Either<Failure, UserModel>> getUserById(int id) async {
    try {
      final result = await _remoteDataSource.getUserById(id);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ServerFailure(e.error));
    }
  }

  Future<Either<Failure, UserModel>> createUser(UserPayload payload) async {
    try {
      final result = await _remoteDataSource.createUser(payload);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ServerFailure(e.error));
    }
  }
}
