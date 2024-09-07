import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/core/services/remote/helpers/api_service.dart';
import 'package:flutter_boilerplate/core/services/remote/responses/base_list_response.dart';
import 'package:flutter_boilerplate/core/utils/exceptions.dart';
import 'package:flutter_boilerplate/core/utils/failure.dart';
import 'package:flutter_boilerplate/data/models/user/user_model.dart';
import 'package:flutter_boilerplate/data/models/user/user_payload.dart';

class UserRemoteDataSource {
  final ApiService _apiService;

  const UserRemoteDataSource(this._apiService);

  Future<Either<Failure, List<UserModel>>> getUsers() async {
    try {
      final response = await _apiService.get('http://10.0.2.2:3000/users',
          authorized: false);
      final result = BaseListResponse.fromJson(
        response.data,
        (json) => UserModel.fromJson((json as Map<String, dynamic>)["data"]),
      );

      return Right(result.data);
    } on ApiException catch (e) {
      return Left(ServerFailure(e.error));
    }
  }

  Future<Either<Failure, UserModel>> getUserById(int id) async {
    try {
      final response = await _apiService.get('http://10.0.2.2:3000/users/$id',
          authorized: false);
      final result = UserModel.fromJson(response.data["data"]);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ServerFailure(e.error));
    }
  }

  Future<Either<Failure, UserModel>> createUser(UserPayload payload) async {
    try {
      final response = await _apiService.post(
        'http://10.0.2.2:3000/users',
        data: payload.toJson(),
        authorized: false,
      );
      final result = UserModel.fromJson(response.data["data"]);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ServerFailure(e.error));
    }
  }
}
