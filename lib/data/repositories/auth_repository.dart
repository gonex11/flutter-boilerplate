import 'dart:core';

import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/core/common/exceptions.dart';
import 'package:flutter_boilerplate/core/common/failures.dart';
import 'package:flutter_boilerplate/data/data_sources/local/auth_local_data_source.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:flutter_boilerplate/data/models/auth/token_response.dart';
import 'package:flutter_boilerplate/data/models/user/user_model.dart';

class AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepository(
    this._remoteDataSource,
    this._localDataSource,
  );

  Future<Either<Failure, TokenResponse>> login(
    String email,
    String password,
  ) async {
    try {
      final result = await _remoteDataSource.login(email, password);

      await _localDataSource.setAccessToken(result.accessToken);
      await _localDataSource.setRefreshToken(result.refreshToken);

      return Right(result);
    } on ApiException catch (e) {
      return Left(ServerFailure(e.error));
    }
  }

  Future<Either<Failure, UserModel>> getLoggedUser() async {
    try {
      final result = await _remoteDataSource.getLoggedUser();
      return Right(result);
    } on ApiException catch (e) {
      final error = e.error?.errors?.firstOrNull;

      if (error != null && error.code == "notAuthenticated") {
        final refreshToken = await _localDataSource.getRefreshToken();

        if (refreshToken != null) {
          final newTokens = await _remoteDataSource.refreshToken(refreshToken);

          await _localDataSource.setAccessToken(newTokens.accessToken);
          await _localDataSource.setAccessToken(newTokens.refreshToken);

          final user = await _remoteDataSource.getLoggedUser();
          return Right(user);
        }
      }

      return Left(ServerFailure(e.error));
    }
  }

  Future<bool> logout() async {
    return await _localDataSource.clearToken();
  }
}
