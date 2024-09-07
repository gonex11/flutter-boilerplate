import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/core/utils/exception_util.dart';
import 'package:flutter_boilerplate/core/utils/failure_util.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/user_remote_data_source.dart';
import 'package:flutter_boilerplate/data/models/user/user_model.dart';
import 'package:flutter_boilerplate/data/models/user/user_payload.dart';

class UserRepository {
  final UserRemoteDataSource _remoteDataSource;

  const UserRepository(this._remoteDataSource);

  Future<Either<Failure, List<UserModel>>> getUsers() async {
    try {
      final result = await _remoteDataSource.getUsers();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ServerFailure(e.error));
    }
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
