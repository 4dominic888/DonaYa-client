import 'package:dona_ya/core/shared/utils/result.dart';

abstract interface class TokenService {
  Future<String?> get accessToken;
  Future<String?> get refreshToken;

  Future<void> refreshAccessToken();
  Future<void> clearTokens();
  
  Future<VoidAppResult> requestToken({required String email, required String password});
  Future<VoidAppResult> validateTokens();
  Future<VoidAppResult> saveTokens();
}