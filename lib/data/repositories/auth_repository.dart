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

  AuthRepository(this._remoteDataSource, this._localDataSource);

  Future<Either<Failure, TokenResponse>> login(
    String username,
    String password,
  ) async {
    try {
      final result = await _remoteDataSource.login(username, password);
      await _localDataSource.setToken(result);

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

    if (cachedUserSession == null) {
      final user = await _remoteDataSource.getLoggedUser();
      await _localDataSource.setUserSession(user);

      return Right(user);
    }

    final isTokenExpired = await _localDataSource.isTokenExpired();

    if (!isTokenExpired) {
      return Right(cachedUserSession);
    }

    final refreshToken = await _localDataSource.getRefreshToken();

    if (refreshToken == null) {
      await _localDataSource.clearSession();
      return Left(AuthFailure());
    }

    try {
      final newTokens = await _remoteDataSource.refreshToken(refreshToken);
      await _localDataSource.setToken(newTokens);

      final user = await _remoteDataSource.getLoggedUser();
      await _localDataSource.setUserSession(user);

      return Right(user);
    } on ApiException catch (_) {
      return Left(AuthFailure());
    }
  }

  Future<bool> logout() async {
    return await _localDataSource.clearSession();
  }
}
