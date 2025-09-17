import 'package:dona_ya/core/authentication/abstractions/repositories/token_service.dart';
import 'package:dona_ya/core/authentication/models/credentials.dart';
import 'package:dona_ya/core/authentication/models/user_register.dart';
import 'package:dona_ya/core/shared/models/user.dart';
import 'package:dona_ya/core/shared/utils/result.dart';

enum AuthenticationStatus { authenticated, unauthenticated, loading, error, unknown }

abstract class AuthService {
  Stream<AuthenticationStatus> get status;
  AuthenticationStatus get currentState;

  User? get currentUser;
  set currentUser(User? user);

  final TokenService tokenService;
  AuthService({required this.tokenService});

  Future<VoidAppResult> register({required final UserRegister userRegister, required final String password});
  Future<VoidAppResult> login({required final String email, required final String password});

  Future<void> logout();
  Future<void> dispose();
}

/* ADDITIONAL AUTH FEATURES */

/// Obtains and manage user cache data
abstract interface class CacheAuthFeature {
  Future<void> cacheUserData(final User user);
  Future<User?> get cachedUser;
  Future<void> clearCache();
}

/* MODES TO AUTH */

abstract interface class OAuthMode {
  Future<Result<AuthData, String>> loginWithOAuth(final OAuthCredentials credentials);
  Future<List<String>> get availableOAuthProviders;
}

abstract interface class BiometricAuthMode {
  Future<bool> get isBiometricAvailable;
  Future<List<BiometricType>> get availableBiometrics;
  Future<AuthData> loginWithBiometric(final BiometricCredentials credentials);
  Future<AuthData> enableBiometric();
  Future<AuthData> disableBiometric();
}

abstract interface class PinAuthMode {
  Future<Result<AuthData, String>> loginWithPin(final String pin);
  Future<Result<AuthData, String>> setPin(final String pin);
  Future<Result<AuthData, String>> changePin(final String oldPin, final String newPin);
  Future<Result<AuthData, String>> removePin();
}

abstract interface class MultiFactorAuthMode {
  Future<bool> get isMfaEnabled;
  Future<Result<AuthData, String>> enableMfa();
  Future<Result<AuthData, String>> disableMfa();
  Future<Result<AuthData, String>> verifyMfaCode(final String code);
}