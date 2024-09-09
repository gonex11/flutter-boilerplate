import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/core/common/app_enums.dart';
import 'package:flutter_boilerplate/core/common/exceptions.dart';
import 'package:flutter_boilerplate/core/common/interceptors.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/services/dio_helper.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/services/responses/base_error_response.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/services/responses/error_detail_response.dart';

class ApiHelper {
  final DioHelper _dioService;
  final HeaderInterceptor _headerInterceptor;

  const ApiHelper(this._dioService, this._headerInterceptor);

  Future<Response> _sendRequest(
    RequestMethod method,
    String endpoint, {
    Object? data,
    Map<String, String>? customHeaders,
    Map<String, dynamic>? queryParams,
    bool authorized = true,
  }) async {
    try {
      if (authorized) {
        _dioService.dio.interceptors.add(_headerInterceptor);
      }
      final response = await _dioService.dio.request(
        endpoint,
        data: data,
        queryParameters: queryParams,
        options: Options(
          method: method.name,
          headers: customHeaders,
          sendTimeout: const Duration(seconds: 300),
          receiveTimeout: const Duration(seconds: 300),
        ),
      );
      return response;
    } catch (e) {
      throw _handleError(e);
    } finally {
      if (authorized) {
        _dioService.dio.interceptors.removeWhere((i) => i is HeaderInterceptor);
      }
    }
  }

  ApiException _handleError(dynamic error) {
    if (error is DioException) {
      final statusCode = error.response?.statusCode ?? 0;
      final errorResponse = BaseErrorResponse.fromJson(
        error.response?.data,
      );
      return ApiException(
        statusCode: statusCode,
        error: errorResponse,
      );
    } else {
      final errorResponse = BaseErrorResponse(
        type: 'unknown_error',
        errors: [
          ErrorDetailResponse(
            code: 'unexpected_error',
            detail: 'An unexpected error occurred: $error',
          )
        ],
      );
      return ApiException(
        statusCode: -1,
        error: errorResponse,
      );
    }
  }

  Future<Response> get(
    String endpoint, {
    Map<String, String>? customHeaders,
    Map<String, dynamic>? queryParams,
    bool authorized = true,
  }) =>
      _sendRequest(
        RequestMethod.get,
        endpoint,
        customHeaders: customHeaders,
        queryParams: queryParams,
        authorized: authorized,
      );

  Future<Response> post(
    String endpoint, {
    required Object? data,
    Map<String, String>? customHeaders,
    Map<String, dynamic>? queryParams,
    bool authorized = true,
  }) =>
      _sendRequest(
        RequestMethod.post,
        endpoint,
        data: data,
        customHeaders: customHeaders,
        queryParams: queryParams,
        authorized: authorized,
      );

  Future<Response> delete(
    String endpoint, {
    required Object? data,
    Map<String, String>? customHeaders,
    Map<String, dynamic>? queryParams,
    bool authorized = true,
  }) =>
      _sendRequest(
        RequestMethod.delete,
        endpoint,
        data: data,
        customHeaders: customHeaders,
        queryParams: queryParams,
        authorized: authorized,
      );

  Future<Response> patch(
    String endpoint, {
    required Object? data,
    Map<String, String>? customHeaders,
    Map<String, dynamic>? queryParams,
    bool authorized = true,
  }) =>
      _sendRequest(
        RequestMethod.patch,
        endpoint,
        data: data,
        customHeaders: customHeaders,
        queryParams: queryParams,
        authorized: authorized,
      );

  Future<Response> put(
    String endpoint, {
    required Object? data,
    Map<String, String>? customHeaders,
    Map<String, dynamic>? queryParams,
    bool authorized = true,
  }) =>
      _sendRequest(
        RequestMethod.put,
        endpoint,
        data: data,
        customHeaders: customHeaders,
        queryParams: queryParams,
        authorized: authorized,
      );

  Future<Response> postMultipart(
    String endpoint, {
    required FormData formData,
    Map<String, String>? customHeaders,
    Map<String, dynamic>? queryParams,
    bool authorized = true,
  }) =>
      _sendRequest(
        RequestMethod.post,
        endpoint,
        data: formData,
        customHeaders: customHeaders,
        queryParams: queryParams,
        authorized: authorized,
      );

  Future<Response> patchMultipart(
    String endpoint, {
    required FormData formData,
    Map<String, String>? customHeaders,
    Map<String, dynamic>? queryParams,
    bool authorized = true,
  }) =>
      _sendRequest(
        RequestMethod.patch,
        endpoint,
        data: formData,
        customHeaders: customHeaders,
        queryParams: queryParams,
        authorized: authorized,
      );

  Future<Response> putMultipart(
    String endpoint, {
    required FormData formData,
    Map<String, String>? customHeaders,
    Map<String, dynamic>? queryParams,
    bool authorized = true,
  }) =>
      _sendRequest(
        RequestMethod.put,
        endpoint,
        data: formData,
        customHeaders: customHeaders,
        queryParams: queryParams,
        authorized: authorized,
      );
}
