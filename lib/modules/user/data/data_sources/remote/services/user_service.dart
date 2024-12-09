import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/modules/user/data/models/user_model.dart';
import 'package:flutter_boilerplate/modules/user/data/models/user_payload.dart';
import 'package:retrofit/retrofit.dart';

part 'generated/user_service.g.dart';

@RestApi()
abstract class UserService {
  factory UserService(Dio dio) = _UserService;

  @GET('/users')
  Future<List<UserModel>> fetchUsers();

  @GET('/users/{id}')
  Future<UserModel> getUserById(@Path() int id);

  @POST('/users')
  Future<UserModel> addUser(@Body() UserPayload payload);
}
