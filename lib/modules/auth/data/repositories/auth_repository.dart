import 'dart:core';

import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/core/common/exceptions.dart';
import 'package:flutter_boilerplate/core/common/failures.dart';
import 'package:flutter_boilerplate/modules/auth/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_boilerplate/modules/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:flutter_boilerplate/modules/auth/data/models/token_model.dart';
import 'package:flutter_boilerplate/modules/user/data/models/user_model.dart';

class AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepository(this._remoteDataSource, this._localDataSource);

  Future<Either<Failure, TokenModel>> login(
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
      await _localDataSource.clearSession();
      return const Left(AuthFailure());
    }

    final cachedUserSession = await _localDataSource.getUserSession();

    if (cachedUserSession == null) {
      try {
        final user = await _remoteDataSource.getLoggedUser();
        await _localDataSource.setUserSession(user);
        return Right(user);
      } catch (e) {
        await _localDataSource.clearSession();
        return const Left(AuthFailure());
      }
    }

    final isTokenExpired = await _localDataSource.isTokenExpired();

    if (!isTokenExpired) {
      return Right(cachedUserSession);
    }

    final refreshToken = await _localDataSource.getRefreshToken();

    if (refreshToken == null) {
      await _localDataSource.clearSession();
      return const Left(AuthFailure());
    }

    try {
      final newTokens = await _remoteDataSource.refreshToken(refreshToken);
      await _localDataSource.setToken(newTokens);

      final user = await _remoteDataSource.getLoggedUser();
      await _localDataSource.setUserSession(user);

      return Right(user);
    } on ApiException catch (_) {
      await _localDataSource.clearSession();
      return const Left(AuthFailure());
    }
  }

  Future<bool> logout() async {
    return await _localDataSource.clearSession();
  }
}
