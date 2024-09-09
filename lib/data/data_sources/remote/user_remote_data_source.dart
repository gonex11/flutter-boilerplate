import 'package:flutter_boilerplate/data/data_sources/remote/services/api_helper.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/services/responses/base_list_response.dart';
import 'package:flutter_boilerplate/data/models/user/user_model.dart';
import 'package:flutter_boilerplate/data/models/user/user_payload.dart';

class UserRemoteDataSource {
  final ApiHelper _apiService;

  const UserRemoteDataSource(this._apiService);

  Future<List<UserModel>> getUsers() async {
    final response =
        await _apiService.get('http://10.0.2.2:3000/users', authorized: false);
    final result = BaseListResponse.fromJson(
      response.data,
      (json) => UserModel.fromJson((json as Map<String, dynamic>)),
    );

    return result.data;
  }

  Future<UserModel> getUserById(int id) async {
    final response = await _apiService.get('http://10.0.2.2:3000/users/$id',
        authorized: false);
    final result = UserModel.fromJson(response.data["data"]);
    return result;
  }

  Future<UserModel> createUser(UserPayload payload) async {
    final response = await _apiService.post(
      'http://10.0.2.2:3000/users',
      data: payload.toJson(),
      authorized: false,
    );
    final result = UserModel.fromJson(response.data["data"]);
    return result;
  }
}
