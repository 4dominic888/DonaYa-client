import 'package:dona_ya/core/authentication/abstractions/repositories/authentication_repository.dart';
import 'package:dona_ya/core/authentication/models/credentials.dart';
import 'package:dona_ya/core/shared/models/user.dart';

abstract class UserRepository {

  final AuthRepository authRepository;
  UserRepository(this.authRepository);

  Stream<User?> get userChanges;

  Future<AuthResult> changePassword(String oldPassword, String newPassword);

  Future<AuthResult> updateEmail(String newEmail);

  Future<AuthResult> updateProfile(Map<String, dynamic> profileData);

  Future<AuthResult> verifyEmail();

  Future<AuthResult> deleteAccount();

  Future<AuthResult> sendEmailVerification();

  void dispose();
}