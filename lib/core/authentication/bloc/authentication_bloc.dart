import 'package:dona_ya/core/authentication/abstractions/repositories/auth_service.dart';
import 'package:dona_ya/core/authentication/abstractions/repositories/user_repository.dart';
import 'package:dona_ya/core/shared/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthService authenticationService,
    required UserRepository userRepository,
  }) : _authService = authenticationService, _userRepository = userRepository,
  super(const AuthenticationState.unknown()) {
    on<AuthenticationSubscriptionRequested>(_onAuthenticationSubscriptionRequested);
    on<AuthenticationLogoutPressed>(_onAuthenticationLogoutPressed);
  }

  final AuthService _authService;
  final UserRepository _userRepository;

  Future<void> _onAuthenticationSubscriptionRequested(AuthenticationSubscriptionRequested event, Emitter<AuthenticationState> emit) async {
    return emit.onEach(_authService.status, onData: (status) async {
      switch (status) {
        case AuthenticationStatus.authenticated:
          final user = _userRepository.currentUser;
          return emit(user != null ? AuthenticationState.authenticated(user) : AuthenticationState.unauthenticated());
        case AuthenticationStatus.unauthenticated:
          return emit(AuthenticationState.unauthenticated());
        case AuthenticationStatus.loading:
          return emit(AuthenticationState.loading());
        case AuthenticationStatus.error:
          return emit(AuthenticationState.error());
        case AuthenticationStatus.unknown:
          return emit(AuthenticationState.unknown());
      }
    }, onError: addError);
  }

  void _onAuthenticationLogoutPressed(AuthenticationLogoutPressed event, Emitter<AuthenticationState> emit) async =>
    _authService.logout();
}