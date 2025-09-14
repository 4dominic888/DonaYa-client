part of 'login_bloc.dart';

final class LoginState extends Equatable {
  const LoginState({
    this.status = FormzSubmissionStatus.initial,
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
    this.isValid = false,
  });

  final FormzSubmissionStatus status;
  final EmailInput email;
  final PasswordInput password;
  final bool isValid;

  LoginState copyWith({
    FormzSubmissionStatus? status,
    EmailInput? email,
    PasswordInput? password,
    bool? isValid,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [status, email, password];
}