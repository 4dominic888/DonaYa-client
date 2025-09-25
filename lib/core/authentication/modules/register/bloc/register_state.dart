part of 'register_bloc.dart';

final class RegisterState extends Equatable {

  const RegisterState({
    this.status = FormzSubmissionStatus.initial,
    this.name = const NameInput.pure(),
    this.surname = const SurnameInput.pure(),
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
    this.phone = const PhoneInput.pure(),
    this.birthdate = const BirthdateInput.pure(),
    this.isValid = false,
    this.error = NoError.empty,
  });

  final FormzSubmissionStatus status;
  final AppError error;
  final NameInput name;
  final SurnameInput surname;
  final EmailInput email;
  final PasswordInput password;
  final PhoneInput phone;
  final BirthdateInput birthdate;
  final bool isValid;

  RegisterState copyWith({
    FormzSubmissionStatus? status,
    NameInput? name,
    SurnameInput? surname,
    EmailInput? email,
    PasswordInput? password,
    PhoneInput? phone,
    BirthdateInput? birthdate,
    bool? isValid,
    AppError? error,
  }) {
    return RegisterState(
      status: status ?? this.status,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      birthdate: birthdate ?? this.birthdate,
      isValid: isValid ?? this.isValid,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [status, name, surname, email, password, phone, birthdate];
}
