import 'dart:async';
import 'package:dona_ya/core/authentication/abstractions/repositories/authentication_repository.dart';
import 'package:dona_ya/core/authentication/abstractions/repositories/user_repository.dart';
import 'package:dona_ya/core/authentication/models/credentials.dart';
import 'package:dona_ya/core/shared/models/user.dart';
import 'package:dona_ya/utils/mock.dart';

class MockUserRepository extends UserRepository {
  final StreamController<User?> _userController = StreamController<User?>.broadcast();
  MockUserRepository({required AuthRepository authRepository}) : super(authRepository);

  @override
  Stream<User?> get userChanges => _userController.stream;

  void _updateUser(User? user) {
    authRepository.currentUser = user;
    _userController.add(user);
  }

  @override
  Future<AuthResult> changePassword(String oldPassword, String newPassword) async {
    await MockUtils.fakeDelay();
    return authRepository.currentUser != null
        ? AuthResult.success(user: authRepository.currentUser!)
        : AuthResult.failure('No user logged in');
  }

  @override
  Future<AuthResult> updateEmail(String newEmail) async {
    await MockUtils.fakeDelay();
    return AuthResult.success(user: authRepository.currentUser!);
  }

  @override
  Future<AuthResult> updateProfile(Map<String, dynamic> profileData) async {
    await MockUtils.fakeDelay();

    if (authRepository.currentUser != null) {
      final currentUser = authRepository.currentUser!;
      final updatedUser = User(
        id: currentUser.id,
        email: profileData['email'] ?? currentUser.email,
        name: profileData['name'] ?? currentUser.name,
        avatarUrl: profileData['photoUrl'] ?? currentUser.avatarUrl,
        metadata: profileData['metadata'] ?? currentUser.metadata,
        createdAt: currentUser.createdAt,
        lastLoginAt: currentUser.lastLoginAt,
      );

      _updateUser(updatedUser);
      return AuthResult.success(user: updatedUser);
    } else {
      return AuthResult.failure('No authenticated user');
    }
  }

  @override
  Future<AuthResult> verifyEmail() async {
    await MockUtils.fakeDelay();
    return AuthResult.success(user: authRepository.currentUser!);
  }

  @override
  Future<AuthResult> sendEmailVerification() async {
    await MockUtils.fakeDelay();
    return AuthResult.success(user: authRepository.currentUser!);
  }

  @override
  Future<AuthResult> deleteAccount() async {
    await MockUtils.fakeDelay();
    _updateUser(null);
    return AuthResult.success(user: null);
  }

  @override
  void dispose() {
    _userController.close();
  }

}