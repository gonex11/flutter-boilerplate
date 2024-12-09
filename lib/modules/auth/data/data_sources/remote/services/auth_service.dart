import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_boilerplate/modules/auth/data/models/login_payload.dart';
import 'package:flutter_boilerplate/modules/auth/data/models/token_model.dart';
import 'package:flutter_boilerplate/modules/user/data/models/user_model.dart';
import 'package:flutter_boilerplate/shared/responses/base_response.dart';
import 'package:retrofit/retrofit.dart';

part 'generated/auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  @GET('/auth/me')
  Future<BaseResponse<UserModel>> getLoggedUser();

  @POST('/auth/login')
  Future<BaseResponse<TokenModel>> login(@Body() LoginPayload payload);
}
