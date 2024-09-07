import 'package:equatable/equatable.dart';
import 'package:flutter_boilerplate/core/services/remote/responses/base_error_response.dart';

abstract class Failure extends Equatable {
  final BaseErrorResponse? error;

  const Failure(this.error);

  @override
  List<Object> get props => [error!];
}

class ServerFailure extends Failure {
  const ServerFailure(super.error);
}
