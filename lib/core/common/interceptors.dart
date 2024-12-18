import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/core/common/exceptions.dart';
import 'package:flutter_boilerplate/core/common/token_manager.dart';
import 'package:flutter_boilerplate/modules/auth/data/models/token_model.dart';
import 'package:flutter_boilerplate/shared/responses/base_error_response.dart';
import 'package:flutter_boilerplate/shared/responses/error_detail_response.dart';
import 'package:flutter_boilerplate/shared/utils/app_constants.dart';
import 'package:flutter_boilerplate/shared/utils/app_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenInterceptor extends Interceptor {
  final Dio _dio;
  final FlutterSecureStorage _secureStorage;
  final TokenManager _tokenManager;

  const TokenInterceptor(
    this._dio,
    this._secureStorage,
    this._tokenManager,
  );

  Future<String?> _getRefreshToken() async {
    final key = AppConstants.secureStorageKeys.refreshToken;
    return await _secureStorage.read(key: key);
  }

  Future<void> _storeNewTokens(TokenModel newTokens) async {
    await Future.wait([
      _secureStorage.write(
        key: AppConstants.secureStorageKeys.refreshToken,
        value: newTokens.refreshToken,
      ),
      _secureStorage.write(
        key: AppConstants.secureStorageKeys.accessToken,
        value: newTokens.accessToken,
      ),
    ]);
  }

  Future<void> _clearSecureStorage() async {
    await _secureStorage.deleteAll();
  }

  Future<bool> _refreshToken() async {
    final refreshToken = await _getRefreshToken();
    if (refreshToken == null || _tokenManager.isTokenExpired(refreshToken)) {
      await _clearSecureStorage();
      return false;
    }

    try {
      final payload = {'refresh_token': refreshToken};
      final response = await _dio.post('/auth/refresh', data: payload);

      final newTokens = TokenModel.fromJson(response.data);
      await _storeNewTokens(newTokens);

      return true;
    } catch (e) {
      await _clearSecureStorage();
      return false;
    }
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await _secureStorage.read(
      key: AppConstants.secureStorageKeys.accessToken,
    );
    if (accessToken?.isNotEmpty == true) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      final refreshed = await _refreshToken();
      if (refreshed) {
        final retryResponse = await _dio.request(
          err.requestOptions.path,
          options: Options(
            method: err.requestOptions.method,
            headers: err.requestOptions.headers,
          ),
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters,
        );
        return handler.resolve(retryResponse);
      } else {
        return handler.next(err);
      }
    }
    return handler.next(err);
  }
}

class ErrorInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final code = response.statusCode ?? 0;
    if (!(code >= 200 && code < 300)) {
      final errorResponse = BaseErrorResponse.fromJson(response.data);
      final exception = ApiException(
        statusCode: response.statusCode ?? -1,
        error: errorResponse,
      );
      throw exception;
    } else if (code >= 400) {
      final exception = ApiException(
        statusCode: -1,
        error: BaseErrorResponse(
          errors: [
            ErrorDetailResponse(
              code: 'unexpected_error',
              detail: AppLocalizations.unexpectedErrorMessage,
            ),
          ],
        ),
      );
      throw exception;
    }
    super.onResponse(response, handler);
  }
}
