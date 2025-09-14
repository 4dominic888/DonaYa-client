import 'dart:async';
import 'dart:math';
import 'package:dona_ya/core/authentication/abstractions/repositories/user_repository.dart';
import 'package:dona_ya/core/authentication/models/user_register.dart';
import 'package:dona_ya/core/shared/models/user.dart';
import 'package:dona_ya/core/shared/utils/result.dart';
import 'package:dona_ya/utils/mock.dart';

class MockUserRepository extends UserRepository {

  User? _currentUser;

  @override
  set currentUser(User? user) => _currentUser = user;

  @override
  User? get currentUser => _currentUser;

  @override
  Future<Result<void, String>> authenticate({required final String email, required final String password}) async {
    await MockUtils.fakeDelay();
    if(email != 'test@example.com') return Err('Email not found');
    if(password != 'Asd_#94567') return Err('Invalid password');
    
    _currentUser = User(
      id: Random().nextInt(10000).toString(),
      email: email,
      name: 'Test User',
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      lastLoginAt: DateTime.now().subtract(const Duration(hours: 2)),
    );

    return Ok(null);
  }

  @override
  Future<Result<void, String>> save(UserRegister userRegister) async {
    await MockUtils.fakeDelay();

    if(userRegister.email.value != 'test@example.com') return Err('Email already exists');

    _currentUser = User(
      id: Random().nextInt(10000).toString(),
      email: userRegister.email.value,
      name: userRegister.username,
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      lastLoginAt: DateTime.now().subtract(const Duration(hours: 2)),
    );

    return Ok(null);
  }
}