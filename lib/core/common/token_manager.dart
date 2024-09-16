import 'package:jwt_decoder/jwt_decoder.dart';

class TokenManager {
  bool isTokenExpired(String token) {
    return JwtDecoder.isExpired(token);
  }
}
