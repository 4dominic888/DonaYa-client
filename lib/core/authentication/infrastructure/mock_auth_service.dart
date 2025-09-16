import 'dart:async';
import 'package:dona_ya/core/authentication/abstractions/repositories/auth_service.dart';
import 'package:dona_ya/core/authentication/abstractions/repositories/token_service.dart';
import 'package:dona_ya/core/authentication/abstractions/repositories/user_repository.dart';
import 'package:dona_ya/core/authentication/infrastructure/mock_token_service.dart';
import 'package:dona_ya/core/authentication/infrastructure/mock_user_repository.dart';
import 'package:dona_ya/core/shared/utils/result.dart';

class MockAuthService extends AuthService {

  MockAuthService({UserRepository? userRepository, TokenService? tokenService}) : 
    super(userRepository: userRepository ?? MockUserRepository(), tokenService: tokenService ?? MockTokenService())
  {
    _controller.stream.listen((status) => _currentState = status);
  }

  AuthenticationStatus _currentState = AuthenticationStatus.unauthenticated;

  final _controller = StreamController<AuthenticationStatus>();

  @override
  AuthenticationStatus get currentState => _currentState;

  @override
  Stream<AuthenticationStatus> get status async * {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  @override
  Future<VoidResult> login({required String email, required String password}) async {
    final loginResult = await super.login(email: email, password: password);
    if(loginResult.isOk) _controller.add(AuthenticationStatus.authenticated);
    return loginResult;
  }

  @override
  Future<void> logout() async {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  @override
  Future<void> dispose() => _controller.close();
}