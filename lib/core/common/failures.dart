import 'package:equatable/equatable.dart';
import 'package:flutter_boilerplate/shared/responses/base_error_response.dart';

abstract class Failure extends Equatable {
  final String? message;
  final BaseErrorResponse? error;

  const Failure(this.error, this.message);

  @override
  List<Object?> get props => [error, message];
}

final class AuthFailure extends Failure {
  const AuthFailure() : super(null, null);
}

final class ServerFailure extends Failure {
  const ServerFailure(BaseErrorResponse? error) : super(error, null);
}

final class CacheFailure extends Failure {
  const CacheFailure(String? message) : super(null, message);
}

final class NetworkFailure extends Failure {
  const NetworkFailure() : super(null, null);
}
