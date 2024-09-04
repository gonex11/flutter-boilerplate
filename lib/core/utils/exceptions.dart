import 'package:flutter_boilerplate/core/services/remote/responses/base_error_response.dart';

class ApiException implements Exception {
  final int statusCode;
  final BaseErrorResponse? error;

  const ApiException({
    required this.statusCode,
    required this.error,
  });
}
