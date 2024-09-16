import 'package:flutter_boilerplate/data/models/base_error_response.dart';

final class ApiException implements Exception {
  final int? statusCode;
  final BaseErrorResponse? error;

  const ApiException({
    this.statusCode,
    this.error,
  });
}

final class CacheException implements Exception {
  final String message;

  const CacheException(this.message);
}
