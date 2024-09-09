import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/core/common/app_constants.dart';
import 'package:flutter_boilerplate/data/data_sources/local/db/secure_storage.dart';

class HeaderInterceptor extends Interceptor {
  final SecureStorage _secureStorage;

  const HeaderInterceptor(this._secureStorage);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String? accessToken = await _secureStorage.read(
      AppConstants.secureStorageKeys.accessToken,
    );
    if (accessToken?.isNotEmpty == true) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    super.onRequest(options, handler);
  }
}
