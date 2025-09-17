import 'package:dona_ya/core/authentication/abstractions/repositories/auth_service.dart';
import 'package:dona_ya/core/authentication/login/models/email_input.dart';
import 'package:dona_ya/core/authentication/login/models/password_input.dart';
import 'package:dona_ya/core/shared/utils/app_error.dart';
import 'package:dona_ya/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthService authenticationService,
  }) : _authService = authenticationService,
       super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  final AuthService _authService;

  void _onEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    final email = EmailInput.dirty(event.username);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.password]),
      ),
    );
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = PasswordInput.dirty(event.password, strict: false);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.email]),
      ),
    );
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        final result = await _authService.login(
          email: state.email.value,
          password: state.password.value,
        );

        if (result.isErr) {
          emit(state.copyWith(
            status: FormzSubmissionStatus.failure,
            error: result.unwrapErr(),
          ));
          return;
        }
        
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } catch (e) {
        emit(state.copyWith(
          status: FormzSubmissionStatus.failure,
          error: NetworkError.unknown,
        ));
        logger.e('Login bloc error', error: e);
      }
    }
  }
}