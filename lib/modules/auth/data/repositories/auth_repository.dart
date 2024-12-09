import 'dart:core';

import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/core/common/exceptions.dart';
import 'package:flutter_boilerplate/core/common/failures.dart';
import 'package:flutter_boilerplate/core/common/token_manager.dart';
import 'package:flutter_boilerplate/modules/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:flutter_boilerplate/modules/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:flutter_boilerplate/modules/auth/data/models/auth_validate_model.dart';
import 'package:flutter_boilerplate/modules/auth/data/models/login_payload.dart';
import 'package:flutter_boilerplate/modules/auth/data/models/token_model.dart';

class AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;
  final TokenManager _tokenManager;

  AuthRepository(
    this._remoteDataSource,
    this._localDataSource,
    this._tokenManager,
  );

  Future<Either<Failure, TokenModel>> login(LoginPayload payload) async {
    try {
      final result = await _remoteDataSource.login(payload);
      await _localDataSource.setToken(result.data!);

      return Right(result.data!);
    } on ApiException catch (e) {
      return Left(ServerFailure(e.error));
    }
  }

  Future<Either<Failure, AuthValidateModel>> validateAuth() async {
    try {
      final accessToken = await _localDataSource.getAccessToken();
      if (accessToken == null) {
        await _localDataSource.clearSession();
        return const Left(AuthFailure());
      }

      if (_tokenManager.isTokenExpired(accessToken)) {
        await _localDataSource.clearSession();
        return const Left(AuthFailure());
      }

      final decodedToken = _tokenManager.decodeToken(accessToken);
      if (decodedToken.isNotEmpty) {
        final auth = AuthValidateModel.fromJson(decodedToken);
        return Right(auth);
      } else {
        await _localDataSource.clearSession();
        return const Left(AuthFailure());
      }
    } catch (_) {
      await _localDataSource.clearSession();
      return const Left(AuthFailure());
    }
  }

  Future<bool> logout() async {
    return await _localDataSource.clearSession();
  }
}
