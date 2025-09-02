import 'dart:async';

import 'package:dona_ya/core/authentication/models/credentials.dart';
import 'package:dona_ya/core/shared/models/user.dart';

enum AuthenticationStatus { authenticated, unauthenticated, loading, error, unknown }

abstract class AuthRepository {
  Stream<AuthenticationStatus> get status;
  Stream<User?> get userChanges;
  User? get currentUser;
  AuthenticationStatus get currentState;

  /// Email/Password Authentication
  Future<AuthResult> signInWithEmailAndPassword(AuthCredentials credentials);
  Future<AuthResult> signUpWithEmailAndPassword(AuthCredentials credentials);
  Future<AuthResult> resetPassword(String email);
  Future<AuthResult> changePassword(String oldPassword, String newPassword);
  Future<AuthResult> updateEmail(String newEmail);

  // // OAuth Authentication (Google, Facebook, Apple, etc.)
  // Future<AuthResult> signInWithOAuth(OAuthCredentials credentials);
  // Future<List<String>> getAvailableOAuthProviders();

  // Anonymous Authentication
  Future<AuthResult> signInAnonymously();

  // // Biometric Authentication
  // Future<bool> isBiometricAvailable();
  // Future<List<BiometricType>> getAvailableBiometrics();
  // Future<AuthResult> signInWithBiometric(BiometricCredentials credentials);
  // Future<AuthResult> enableBiometric();
  // Future<AuthResult> disableBiometric();

  // // PIN/Pattern Authentication
  // Future<AuthResult> signInWithPin(String pin);
  // Future<AuthResult> setPin(String pin);
  // Future<AuthResult> changePin(String oldPin, String newPin);
  // Future<AuthResult> removePin();

  // // Token Management
  // Future<String?> getAccessToken();
  // Future<String?> getRefreshToken();
  // Future<AuthResult> refreshAccessToken();
  // Future<void> clearTokens();

  // Session Management
  Future<bool> isAuthenticated();
  Future<void> signOut();
  Future<void> signOutAllDevices();
  Future<AuthResult> validateSession();

  // Account Management
  Future<AuthResult> deleteAccount();
  Future<AuthResult> updateProfile(Map<String, dynamic> profileData);
  Future<AuthResult> verifyEmail();
  Future<AuthResult> sendEmailVerification();

  // // Multi-Factor Authentication (MFA)
  // Future<bool> isMfaEnabled();
  // Future<AuthResult> enableMfa();
  // Future<AuthResult> disableMfa();
  // Future<AuthResult> verifyMfaCode(String code);

  // // Local Storage/Cache
  // Future<void> cacheUserData(User user);
  // Future<User?> getCachedUser();
  // Future<void> clearCache();

  // // Security Features
  // Future<List<Map<String, dynamic>>> getActiveSessions();
  // Future<void> terminateSession(String sessionId);
  // Future<AuthResult> reportSuspiciousActivity();
}

// // Implementation helper classes
// abstract class LocalAuthStorage {
//   Future<void> storeSecurely(String key, String value);
//   Future<String?> getSecurely(String key);
//   Future<void> deleteSecurely(String key);
//   Future<void> clearAll();
// }

// abstract class NetworkAuthProvider {
//   Future<AuthResult> authenticate(Map<String, dynamic> credentials);
//   Future<AuthResult> refreshToken(String refreshToken);
//   Future<void> revokeToken(String token);
// }