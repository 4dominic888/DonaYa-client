import 'dart:async';
import 'dart:math';

import 'package:dona_ya/core/authentication/models/credentials.dart';
import 'package:dona_ya/core/shared/models/user.dart';
import 'package:dona_ya/core/authentication/abstractions/repositories/authentication_repository.dart';

class MockAuthRepository implements AuthRepository {

  final StreamController<AuthenticationStatus> _authStateController = StreamController<AuthenticationStatus>.broadcast();
  final StreamController<User?> _userController = StreamController<User?>.broadcast();
  User? _currentUser;
  AuthenticationStatus _currentState = AuthenticationStatus.unauthenticated;
  
  // Mock data storage
  final List<User> _mockUsers = [];
  String? _accessToken;
  String? _refreshToken;

  MockAuthRepository() {
    _mockUsers.addAll([
      User(
        id: '1',
        email: 'test@example.com',
        name: 'Test User',
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
        lastLoginAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      User(
        id: '2',
        email: 'john@example.com',
        name: 'John Doe',
        createdAt: DateTime.now().subtract(const Duration(days: 60)),
        lastLoginAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ]);
  }

  @override
  Stream<AuthenticationStatus> get status => _authStateController.stream;

  @override
  Stream<User?> get userChanges => _userController.stream;

  @override
  AuthenticationStatus get currentState => _currentState;

  @override
  User? get currentUser => _currentUser;

  void _updateAuthState(AuthenticationStatus newState) {
    _currentState = newState;
    _authStateController.add(newState);
  }

  void _updateUser(User? user) {
    _currentUser = user;
    _userController.add(user);
  }

  Future<void> _mockDelay() async {
    await Future.delayed(Duration(milliseconds: 500 + Random().nextInt(1000)));
  }


  @override
  Future<AuthResult> signInWithEmailAndPassword(AuthCredentials credentials) async {
    _updateAuthState(AuthenticationStatus.loading);
    await _mockDelay();

    final user = _mockUsers.firstWhere(
      (u) => u.email == credentials.email,
      orElse: () => throw StateError('User not found'),
    );

    if (credentials.password == '123456') {
      _accessToken = 'mock_access_token_${Random().nextInt(10000)}';
      _refreshToken = 'mock_refresh_token_${Random().nextInt(10000)}';
      
      final authenticatedUser = User(
        id: user.id,
        email: user.email,
        name: user.name,
        createdAt: user.createdAt,
        lastLoginAt: DateTime.now(),
      );

      _updateUser(authenticatedUser);
      _updateAuthState(AuthenticationStatus.authenticated);

      return AuthResult.success(
        user: authenticatedUser,
        token: _accessToken,
        refreshToken: _refreshToken,
      );
    } else {
      _updateAuthState(AuthenticationStatus.error);
      return AuthResult.failure('Invalid password');
    }
  }

  @override
  Future<AuthResult> signUpWithEmailAndPassword(AuthCredentials credentials) async {
    _updateAuthState(AuthenticationStatus.loading);
    await _mockDelay();

    if (_mockUsers.any((u) => u.email == credentials.email)) {
      _updateAuthState(AuthenticationStatus.error);
      return AuthResult.failure('Email already exists');
    }

    // Create new user
    final newUser = User(
      id: (DateTime.now().millisecondsSinceEpoch).toString(),
      email: credentials.email,
      name: credentials.additionalData?['name'] ?? 'New User',
      createdAt: DateTime.now(),
      lastLoginAt: DateTime.now(),
    );

    _mockUsers.add(newUser);
    _accessToken = 'mock_access_token_${Random().nextInt(10000)}';
    _refreshToken = 'mock_refresh_token_${Random().nextInt(10000)}';

    _updateUser(newUser);
    _updateAuthState(AuthenticationStatus.authenticated);

    return AuthResult.success(
      user: newUser,
      token: _accessToken,
      refreshToken: _refreshToken,
    );
  }

  @override
  Future<AuthResult> changePassword(String oldPassword, String newPassword) async {
    await _mockDelay();
    return AuthResult.success(user: _currentUser!);
  }

  @override
  Future<AuthResult> deleteAccount() async {
    await _mockDelay();
    await signOut();
    return AuthResult.success(user: null);
  }

  @override
  Future<bool> isAuthenticated() async {
    await _mockDelay();
    return _currentState == AuthenticationStatus.authenticated && _currentUser != null;
  }

  @override
  Future<AuthResult> resetPassword(String email) async {
    await _mockDelay();

    if (_mockUsers.any((u) => u.email == email)) {
      return AuthResult.success(
        user: null,
        metadata: {'message': 'Password reset email sent'},
      );
    } else {
      return AuthResult.failure('Email not found');
    }
  }

  @override
  Future<AuthResult> sendEmailVerification() async {
    await _mockDelay();
    return AuthResult.success(user: _currentUser!);
  }

  @override
  Future<AuthResult> signInAnonymously() async {
    _updateAuthState(AuthenticationStatus.loading);
    await _mockDelay();

    final anonymousUser = User(
      id: 'anonymous_${Random().nextInt(10000)}',
      email: 'anonymous@local.app',
      name: 'Anonymous User',
      createdAt: DateTime.now(),
      lastLoginAt: DateTime.now(),
    );

    _updateUser(anonymousUser);
    _updateAuthState(AuthenticationStatus.authenticated);

    return AuthResult.success(user: anonymousUser);
  }

  @override
  Future<void> signOut() async {
    await _mockDelay();
    _accessToken = null;
    _refreshToken = null;
    _updateUser(null);
    _updateAuthState(AuthenticationStatus.unauthenticated);
  }

  @override
  Future<void> signOutAllDevices() async {
    await _mockDelay();
    await signOut();
  }

  @override
  Future<AuthResult> updateEmail(String newEmail) async {
    await _mockDelay();
    return AuthResult.success(user: _currentUser!);
  }

  @override
  Future<AuthResult> updateProfile(Map<String, dynamic> profileData) async {
    await _mockDelay();

    if (_currentUser != null) {
      final updatedUser = User(
        id: _currentUser!.id,
        email: profileData['email'] ?? _currentUser!.email,
        name: profileData['name'] ?? _currentUser!.name,
        avatarUrl: profileData['photoUrl'] ?? _currentUser!.avatarUrl,
        metadata: profileData['metadata'] ?? _currentUser!.metadata,
        createdAt: _currentUser!.createdAt,
        lastLoginAt: _currentUser!.lastLoginAt,
      );

      _updateUser(updatedUser);
      return AuthResult.success(user: updatedUser);
    } else {
      return AuthResult.failure('No authenticated user');
    }
  }

  @override
  Future<AuthResult> validateSession() async {
    await _mockDelay();
    if (_currentUser != null && _accessToken != null) {
      return AuthResult.success(user: _currentUser!);
    }
    return AuthResult.failure('Invalid session');
  }

  @override
  Future<AuthResult> verifyEmail() async {
    await _mockDelay();
    return AuthResult.success(user: _currentUser!);
  }

}