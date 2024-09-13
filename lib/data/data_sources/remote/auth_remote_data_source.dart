import 'package:flutter_boilerplate/core/services/api_service.dart';
import 'package:flutter_boilerplate/data/models/token_model.dart';
import 'package:flutter_boilerplate/data/models/user_model.dart';

class AuthRemoteDataSource {
  final ApiService _apiService;

  const AuthRemoteDataSource(this._apiService);

  Future<UserModel> getLoggedUser() async {
    final response = await _apiService.get('http://10.0.2.2:3000/auth/me');
    final result = UserModel.fromJson(response.data['data']);
    return result;
  }

  Future<TokenModel> login(String username, String password) async {
    final payload = {'username': username, 'password': password};
    final response = await _apiService.post(
      'http://10.0.2.2:3000/auth/login',
      data: payload,
      authorized: false,
    );
    final result = TokenModel.fromJson(response.data["data"]);
    return result;
  }

  Future<TokenModel> refreshToken(String refreshToken) async {
    final response = await _apiService.post(
      'http://10.0.2.2:3000/auth/refresh',
      data: {'refresh_token': refreshToken},
      authorized: false,
    );
    final result = TokenModel.fromJson(response.data["data"]);
    return result;
  }
}
