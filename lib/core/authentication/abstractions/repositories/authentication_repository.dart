import 'dart:async';
import 'package:dona_ya/core/authentication/models/credentials.dart';
import 'package:dona_ya/core/shared/models/user.dart';

enum AuthenticationStatus { authenticated, unauthenticated, loading, error, unknown }

abstract class AuthRepository {
  Stream<AuthenticationStatus> get status;
  User? get currentUser;
  set currentUser(User? user);
  AuthenticationStatus get currentState;

  Future<AuthResult> signInWithEmailAndPassword(AuthCredentials credentials);
  Future<AuthResult> signUpWithEmailAndPassword(AuthCredentials credentials);
  Future<AuthResult> resetPassword(String email);

  Future<AuthResult> signInAnonymously();

  Future<bool> isAuthenticated();
  Future<void> signOut();
  Future<void> signOutAllDevices();
  Future<AuthResult> validateSession();

  void dispose();
}