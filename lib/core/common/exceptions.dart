import 'package:flutter_boilerplate/data/models/base_error_response.dart';

class ApiException implements Exception {
  final int statusCode;
  final BaseErrorResponse? error;

  const ApiException({
    required this.statusCode,
    required this.error,
  });
}

class CacheException implements Exception {
  final String message;

  CacheException(this.message);
}
