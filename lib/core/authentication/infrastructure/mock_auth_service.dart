import 'dart:async';
import 'dart:math';
import 'package:dona_ya/core/authentication/abstractions/repositories/auth_service.dart';
import 'package:dona_ya/core/authentication/abstractions/repositories/token_service.dart';
import 'package:dona_ya/core/authentication/infrastructure/mock_token_service.dart';
import 'package:dona_ya/core/authentication/models/user_register.dart';
import 'package:dona_ya/core/shared/models/user.dart';
import 'package:dona_ya/core/shared/utils/app_error.dart';
import 'package:dona_ya/core/shared/utils/result.dart';
import 'package:dona_ya/utils/mock.dart';

class MockAuthService extends AuthService {

  MockAuthService({TokenService? tokenService}) : 
    super(tokenService: tokenService ?? MockTokenService())
  {
    _controller.stream.listen((status) => _currentState = status);
  }

  AuthenticationStatus _currentState = AuthenticationStatus.unauthenticated;

  final _controller = StreamController<AuthenticationStatus>();

  @override
  AuthenticationStatus get currentState => _currentState;

  User? _currentUser;

  @override
  set currentUser(User? user) => _currentUser = user;

  @override
  User? get currentUser => _currentUser;

  @override
  Stream<AuthenticationStatus> get status async * {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  @override
  Future<VoidAppResult> login({required String email, required String password}) async {
    await MockUtils.fakeDelay();
    if(email != 'test@example.com') return Err(AuthenticationError.noEmailFounded);
    if(password != 'Asd_#94567') return Err(AuthenticationError.badPassword);
    
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
  Future<VoidAppResult> register({required final UserRegister userRegister, required final String password}) async {
    await MockUtils.fakeDelay();

    if(userRegister.email.value != 'test@example.com') return Err(AuthenticationError.emailAlreadyExists);
    if(!userRegister.isValid) return Err(AuthenticationError.badRegistrationData);

    _currentUser = User(
      id: Random().nextInt(10000).toString(),
      email: userRegister.email.value,
      name: userRegister.username,
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      lastLoginAt: DateTime.now().subtract(const Duration(hours: 2)),
    );

    return Ok(null);
  }

  @override
  Future<void> logout() async {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  @override
  Future<void> dispose() => _controller.close();
}