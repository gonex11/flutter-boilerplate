import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/login_payload.freezed.dart';
part 'generated/login_payload.g.dart';

@Freezed(toJson: true, fromJson: false)
class LoginPayload with _$LoginPayload {
  const factory LoginPayload({
    required String username,
    required String password,
  }) = _LoginPayload;
}
