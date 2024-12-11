import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_boilerplate/modules/user/data/models/user_model.dart';
import 'package:flutter_boilerplate/modules/user/data/models/user_payload.dart';
import 'package:flutter_boilerplate/shared/responses/base_response.dart';
import 'package:retrofit/retrofit.dart';

part 'generated/user_service.g.dart';

@RestApi()
abstract class UserService {
  factory UserService(Dio dio) = _UserService;

  @GET('/users')
  Future<BaseResponse<List<UserModel>>> fetchUsers(
    @Query('page') int? page,
    @Query('limit') int limit,
  );

  @GET('/users/{id}')
  Future<BaseResponse<UserModel>> getUserById(@Path() int id);

  @POST('/users')
  Future<BaseResponse<UserModel>> addUser(@Body() UserPayload payload);
}
