import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/core/utils/constants_util.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HeaderInterceptor extends Interceptor {
  final FlutterSecureStorage _secureStorage;

  const HeaderInterceptor(this._secureStorage);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String? accessToken = await _secureStorage.read(
      key: ConstantsUtil.secureStorageKeys.accessToken,
    );
    if (accessToken?.isNotEmpty == true) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    super.onRequest(options, handler);
  }
}
