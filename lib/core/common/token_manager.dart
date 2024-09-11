import 'package:jwt_decoder/jwt_decoder.dart';

class TokenManager {
  Future<bool> isTokenExpired(String token) async {
    return await JwtDecoder.isExpired(token);
  }
}
