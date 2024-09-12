import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/data/models/base_error_response.dart';

class ApiException extends DioException {
  final int? statusCode;
  final BaseErrorResponse? error;

  ApiException({
    this.statusCode,
    this.error,
  }) : super(requestOptions: RequestOptions());
}

class CacheException implements Exception {
  final String message;

  CacheException(this.message);
}
