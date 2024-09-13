import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/core/common/app_enums.dart';
import 'package:flutter_boilerplate/core/common/exceptions.dart';
import 'package:flutter_boilerplate/core/common/interceptors.dart';
import 'package:flutter_boilerplate/data/models/base_error_response.dart';
import 'package:flutter_boilerplate/data/models/error_detail_response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio) {
    _setupHttpClientAdapter();
    _setupInterceptors();
  }

  void _setupHttpClientAdapter() {
    _dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final SecurityContext scontext = SecurityContext();
        HttpClient client = HttpClient(context: scontext);
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );
  }

  void _setupInterceptors() {
    _dio.options.responseType = ResponseType.json;
    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          request: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }
  }

  ApiException _handleError(dynamic error) {
    if (error is DioException) {
      final errorResponse = error.response != null
          ? BaseErrorResponse.fromJson(error.response?.data)
          : BaseErrorResponse(
              type: 'unknown_error',
              errors: [
                ErrorDetailResponse(
                  code: 'unexpected_error',
                  detail: 'An unexpected error occurred: ${error.message}',
                ),
              ],
            );

      return ApiException(
        statusCode: error.response?.statusCode ?? -1,
        error: errorResponse,
      );
    } else {
      final errorResponse = BaseErrorResponse(
        type: 'unknown_error',
        errors: [
          ErrorDetailResponse(
            code: 'unexpected_error',
            detail: 'An unexpected error occurred: ${error.message}',
          ),
        ],
      );

      return ApiException(
        statusCode: -1,
        error: errorResponse,
      );
    }
  }

  Future<Response> _sendRequest(
    RequestMethod method,
    String endpoint, {
    Object? data,
    Map<String, String>? customHeaders,
    Map<String, dynamic>? queryParams,
    bool authorized = true,
  }) async {
    try {
      final headerInterceptor = HeaderInterceptor(Get.find());
      if (authorized) {
        _dio.interceptors.add(headerInterceptor);
      }
      final response = await _dio.request(
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
        _dio.interceptors.removeWhere((i) => i is HeaderInterceptor);
      }
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
