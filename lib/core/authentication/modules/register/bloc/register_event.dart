part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

final class RegisterFirstNameChanged extends RegisterEvent {
  const RegisterFirstNameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

final class RegisterSurnameChanged extends RegisterEvent {
  const RegisterSurnameChanged(this.surname);

  final String surname;

  @override
  List<Object> get props => [surname];
}

final class RegisterEmailChanged extends RegisterEvent {
  const RegisterEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

final class RegisterPasswordChanged extends RegisterEvent {
  const RegisterPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

final class RegisterPhoneChanged extends RegisterEvent {
  const RegisterPhoneChanged(this.phone);

  final PhoneNumber phone;

  @override
  List<Object> get props => [phone];
}

final class RegisterBirthdateChanged extends RegisterEvent {
  const RegisterBirthdateChanged(this.birthdate);

  final String birthdate;

  @override
  List<Object> get props => [birthdate];
}

final class RegisterSubmitted extends RegisterEvent {
  const RegisterSubmitted();
}