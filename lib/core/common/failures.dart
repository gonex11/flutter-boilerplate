import 'package:equatable/equatable.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/services/responses/base_error_response.dart';

abstract class Failure extends Equatable {
  final String? message;
  final BaseErrorResponse? error;

  const Failure(this.error, this.message);

  @override
  List<Object> get props => [error!, message!];
}

class AuthFailure extends Failure {
  const AuthFailure() : super(null, null);
}

class ServerFailure extends Failure {
  final BaseErrorResponse? error;

  const ServerFailure(this.error) : super(error, '');
}

class CacheFailure extends Failure {
  final String? message;

  const CacheFailure(this.message) : super(null, message);
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super(null, null);
}
