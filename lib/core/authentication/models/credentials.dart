import 'package:dona_ya/core/shared/models/user.dart';

class AuthCredentials {
  final String email;
  final String password;
  final Map<String, dynamic>? additionalData;

  const AuthCredentials({
    required this.email,
    required this.password,
    this.additionalData,
  });
}

// enum BiometricType {
//   fingerprint,
//   face,
//   iris,
//   voice,
//   none,
// }

// class BiometricCredentials {
//   final String reason;
//   final bool useErrorDialogs;
//   final bool stickyAuth;

//   const BiometricCredentials({
//     this.reason = 'Please authenticate to continue',
//     this.useErrorDialogs = true,
//     this.stickyAuth = false,
//   });
// }

// class OAuthCredentials {
//   final String provider;
//   final Map<String, String>? scopes;
//   final Map<String, dynamic>? parameters;

//   const OAuthCredentials({
//     required this.provider,
//     this.scopes,
//     this.parameters,
//   });
// }

class AuthResult {
  final bool success;
  final User? user;
  final String? error;
  final String? token;
  final String? refreshToken;
  final Map<String, dynamic>? metadata;

  const AuthResult({
    required this.success,
    this.user,
    this.error,
    this.token,
    this.refreshToken,
    this.metadata,
  });

  factory AuthResult.success({
    User? user,
    String? token,
    String? refreshToken,
    Map<String, dynamic>? metadata,
  }) => AuthResult(
    success: true,
    user: user,
    token: token,
    refreshToken: refreshToken,
    metadata: metadata,
  );

  factory AuthResult.failure(String error) => AuthResult(
    success: false,
    error: error,
  );
}