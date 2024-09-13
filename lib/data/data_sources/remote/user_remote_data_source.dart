import 'package:flutter_boilerplate/core/services/api_service.dart';
import 'package:flutter_boilerplate/data/models/base_list_response.dart';
import 'package:flutter_boilerplate/data/models/user_model.dart';
import 'package:flutter_boilerplate/data/models/user_payload.dart';

class UserRemoteDataSource {
  final ApiService _apiService;

  const UserRemoteDataSource(this._apiService);

  Future<List<UserModel>> getUsers() async {
    final response = await _apiService.get('http://10.0.2.2:3000/users');
    final result = BaseListResponse.fromJson(
      response.data,
      (json) => UserModel.fromJson((json as Map<String, dynamic>)),
    );
    return result.data;
  }

  Future<UserModel> getUserById(int id) async {
    final response = await _apiService.get('http://10.0.2.2:3000/users/$id');
    final result = UserModel.fromJson(response.data['data']);
    return result;
  }

  Future<UserModel> createUser(UserPayload payload) async {
    final response = await _apiService.post(
      'http://10.0.2.2:3000/users',
      data: payload.toJson(),
    );
    final result = UserModel.fromJson(response.data['data']);
    return result;
  }
}
