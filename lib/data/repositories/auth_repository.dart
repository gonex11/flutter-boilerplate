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
    String username,
    String password,
  ) async {
    try {
      final result = await _remoteDataSource.login(username, password);

      await _localDataSource.setAccessToken(result.accessToken);
      await _localDataSource.setRefreshToken(result.refreshToken);

      return Right(result);
    } on ApiException catch (e) {
      return Left(ServerFailure(e.error));
    }
  }

  Future<Either<Failure, UserModel>> getLoggedUser() async {
    final accessToken = await _localDataSource.getAccessToken();

    if (accessToken == null) {
      return Left(AuthFailure());
    }

    final cachedUserSession = await _localDataSource.getUserSession();

    if (cachedUserSession != null) {
      if (await _localDataSource.isTokenExpired()) {
        final refreshToken = await _localDataSource.getRefreshToken();

        if (refreshToken != null) {
          final newTokens = await _remoteDataSource.refreshToken(refreshToken);

          await _localDataSource.setAccessToken(newTokens.accessToken);
          await _localDataSource.setRefreshToken(newTokens.refreshToken);

          final user = await _remoteDataSource.getLoggedUser();
          await _localDataSource.setUserSession(user);

          return Right(user);
        } else {
          await _localDataSource.clearSession();
          return Left(AuthFailure());
        }
      } else {
        return Right(cachedUserSession);
      }
    }

    final user = await _remoteDataSource.getLoggedUser();
    await _localDataSource.setUserSession(user);

    return Right(user);
  }

  Future<bool> logout() async {
    return await _localDataSource.clearSession();
  }
}
