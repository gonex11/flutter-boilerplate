import 'package:equatable/equatable.dart';
import 'package:flutter_boilerplate/data/models/base_error_response.dart';

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
  final BaseErrorResponse? error;

  const ServerFailure(this.error) : super(error, null);
}

final class CacheFailure extends Failure {
  final String? message;

  const CacheFailure(this.message) : super(null, message);
}

final class NetworkFailure extends Failure {
  const NetworkFailure() : super(null, null);
}
