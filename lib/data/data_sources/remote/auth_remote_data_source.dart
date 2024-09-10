import 'package:flutter_boilerplate/data/data_sources/remote/services/api_service.dart';
import 'package:flutter_boilerplate/data/models/auth/token_response.dart';
import 'package:flutter_boilerplate/data/models/user/user_model.dart';

class AuthRemoteDataSource {
  final ApiService _apiService;

  const AuthRemoteDataSource(this._apiService);

  Future<UserModel> getLoggedUser() async {
    final response = await _apiService.get('http://10.0.2.2:3000/me');
    final result = UserModel.fromJson(response.data['data']);
    return result;
  }

  Future<TokenResponse> login(String email, String password) async {
    final payload = {'email': email, 'password': password};
    final response = await _apiService.post(
      'http://10.0.2.2:3000/login',
      data: payload,
      authorized: false,
    );
    final result = TokenResponse.fromJson(response.data["data"]);
    return result;
  }

  Future<TokenResponse> refreshToken(String refreshToken) async {
    final response = await _apiService.post(
      'http://10.0.2.2:3000/refresh',
      data: {'refresh_token': refreshToken},
      authorized: false,
    );
    final result = TokenResponse.fromJson(response.data["data"]);
    return result;
  }
}
