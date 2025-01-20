import 'package:flutter_boilerplate/modules/auth/data/data_sources/remote/services/auth_service.dart';
import 'package:flutter_boilerplate/modules/auth/data/models/login_payload.dart';
import 'package:flutter_boilerplate/modules/auth/data/models/token_model.dart';
import 'package:flutter_boilerplate/shared/responses/base_response.dart';

class AuthRemoteDataSource {
  final AuthService _authService;

  const AuthRemoteDataSource(this._authService);

  Future<BaseResponse<TokenModel>> login(LoginPayload payload) =>
      _authService.login(payload);
}
