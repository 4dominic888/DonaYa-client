# Things to add
## Authentication Repository

**OAuth Authentication (Google, Facebook, Apple, etc.)**
```dart
  Future<AuthResult> signInWithOAuth(OAuthCredentials credentials);
  Future<List<String>> getAvailableOAuthProviders();
```

**Biometric Authentication**
```dart
  Future<bool> isBiometricAvailable();
  Future<List<BiometricType>> getAvailableBiometrics();
  Future<AuthResult> signInWithBiometric(BiometricCredentials credentials);
  Future<AuthResult> enableBiometric();
  Future<AuthResult> disableBiometric();
```

**PIN/Pattern Authentication**
```dart
  Future<AuthResult> signInWithPin(String pin);
  Future<AuthResult> setPin(String pin);
  Future<AuthResult> changePin(String oldPin, String newPin);
  Future<AuthResult> removePin();
```

**Token Management**
```dart
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<AuthResult> refreshAccessToken();
  Future<void> clearTokens();
```

**Multi-Factor Authentication (MFA)**
```dart
  Future<bool> isMfaEnabled();
  Future<AuthResult> enableMfa();
  Future<AuthResult> disableMfa();
  Future<AuthResult> verifyMfaCode(String code);
```

**Local Storage/Cache**
```dart
  Future<void> cacheUserData(User user);
  Future<User?> getCachedUser();
  Future<void> clearCache();
```

**Security Features**
```dart
  Future<List<Map<String, dynamic>>> getActiveSessions();
  Future<void> terminateSession(String sessionId);
  Future<AuthResult> reportSuspiciousActivity();
```

## Extra repos

**Local Storage/Cache**
```dart
abstract class LocalAuthStorage {
  Future<void> storeSecurely(String key, String value);
  Future<String?> getSecurely(String key);
  Future<void> deleteSecurely(String key);
  Future<void> clearAll();
}
```

**Network Auth Provider**
```dart
abstract class NetworkAuthProvider {
  Future<AuthResult> authenticate(Map<String, dynamic> credentials);
  Future<AuthResult> refreshToken(String refreshToken);
  Future<void> revokeToken(String token);
}
```