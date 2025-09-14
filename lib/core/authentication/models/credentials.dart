import 'package:dona_ya/core/shared/models/user.dart';

enum BiometricType {
  fingerprint,
  face,
  iris,
  voice,
  none,
}

class BiometricCredentials {
  final String reason;
  final bool useErrorDialogs;
  final bool stickyAuth;

  const BiometricCredentials({
    this.reason = 'Please authenticate to continue',
    this.useErrorDialogs = true,
    this.stickyAuth = false,
  });
}

class OAuthCredentials {
  final String provider;
  final Map<String, String>? scopes;
  final Map<String, dynamic>? parameters;

  const OAuthCredentials({
    required this.provider,
    this.scopes,
    this.parameters,
  });
}

class AuthData {
  final User? user;
  final String? token;
  final String? refreshToken;
  final Map<String, dynamic>? metadata;

  const AuthData({
    this.user,
    this.token,
    this.refreshToken,
    this.metadata,
  });
}