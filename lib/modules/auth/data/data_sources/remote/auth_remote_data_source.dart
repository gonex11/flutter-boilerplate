import 'package:flutter_boilerplate/modules/auth/data/data_sources/remote/services/auth_service.dart';
import 'package:flutter_boilerplate/modules/auth/data/models/login_payload.dart';
import 'package:flutter_boilerplate/modules/auth/data/models/token_model.dart';
import 'package:flutter_boilerplate/modules/user/data/models/user_model.dart';

class AuthRemoteDataSource {
  final AuthService _authService;

  const AuthRemoteDataSource(this._authService);

  Future<UserModel> getLoggedUser() => _authService.getLoggedUser();

  Future<TokenModel> login(LoginPayload payload) => _authService.login(payload);

  Future<TokenModel> refreshToken(String refreshToken) =>
      _authService.refreshToken(refreshToken);
}
