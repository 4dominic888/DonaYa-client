import 'dart:async';
import 'dart:math';
import 'package:dona_ya/core/authentication/models/credentials.dart';
import 'package:dona_ya/core/shared/models/user.dart';
import 'package:dona_ya/core/authentication/abstractions/repositories/authentication_repository.dart';
import 'package:dona_ya/utils/mock.dart';

class MockAuthRepository implements AuthRepository {

  final StreamController<AuthenticationStatus> _authStateController = StreamController<AuthenticationStatus>.broadcast();
  User? _currentUser;
  AuthenticationStatus _currentState = AuthenticationStatus.unauthenticated;
  
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
  AuthenticationStatus get currentState => _currentState;

  @override
  User? get currentUser => _currentUser;

  @override
  set currentUser(User? user) {
    _currentUser = user;
  }

  void _updateAuthState(AuthenticationStatus newState) {
    _currentState = newState;
    _authStateController.add(newState);
  }

  void _updateUser(User? user) {
    currentUser = user;
  }

  @override
  Future<AuthResult> signInWithEmailAndPassword(AuthCredentials credentials) async {
    _updateAuthState(AuthenticationStatus.loading);
    await MockUtils.fakeDelay();

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
    await MockUtils.fakeDelay();

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
  Future<bool> isAuthenticated() async {
    await MockUtils.fakeDelay();
    return _currentState == AuthenticationStatus.authenticated && _currentUser != null;
  }

  @override
  Future<AuthResult> resetPassword(String email) async {
    await MockUtils.fakeDelay();

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
  Future<AuthResult> signInAnonymously() async {
    _updateAuthState(AuthenticationStatus.loading);
    await MockUtils.fakeDelay();

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
    await MockUtils.fakeDelay();
    _accessToken = null;
    _refreshToken = null;
    _updateUser(null);
    _updateAuthState(AuthenticationStatus.unauthenticated);
  }

  @override
  Future<void> signOutAllDevices() async {
    await MockUtils.fakeDelay();
    await signOut();
  }

  @override
  Future<AuthResult> validateSession() async {
    await MockUtils.fakeDelay();
    if (_currentUser != null && _accessToken != null) {
      return AuthResult.success(user: _currentUser!);
    }
    return AuthResult.failure('Invalid session');
  }

  @override
  void dispose() {
    _authStateController.close();
    _currentUser = null;
    _currentState = AuthenticationStatus.unauthenticated;
    _accessToken = null;
    _refreshToken = null;
    _mockUsers.clear();
  }
}