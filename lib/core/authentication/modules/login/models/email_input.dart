import 'package:formz/formz.dart';

enum EmailValidationError {
  empty('Email cannot be empty'),
  invalid('Email is invalid');

  final String message;
  const EmailValidationError(this.message);
}

class EmailInput extends FormzInput<String, EmailValidationError> {
  
  const EmailInput.pure() : super.pure('');
  const EmailInput.dirty(super.value) : super.dirty();

  static final _regex = RegExp(
    r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$',
  );

  @override
  EmailValidationError? validator(String value) {
    value = value.trim();
    if (value.isEmpty) return EmailValidationError.empty;
    if (!_regex.hasMatch(value)) return EmailValidationError.invalid;
    return null;
  }
}