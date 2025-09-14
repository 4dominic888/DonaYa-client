import 'package:formz/formz.dart';

enum PasswordValidationError {
  empty('Password cannot be empty'),
  tooShort('Password must be at least 8 characters long'),
  noUpper('Password must contain at least one uppercase letter'),
  noLower('Password must contain at least one lowercase letter'),
  noNumber('Password must contain at least one number'),
  noSpecial('Password must contain at least one special character');

  final String message;
  const PasswordValidationError(this.message);
}

class PasswordInput extends FormzInput<String, PasswordValidationError> {

  final bool strict;

  const PasswordInput.pure({this.strict = false}) : super.pure('');
  const PasswordInput.dirty(super.value, {this.strict = false}) : super.dirty();

  static final _regex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~])[A-Za-z\d!@#\$&*~]{8,}$'
  );

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) return PasswordValidationError.empty;
    if (!strict) return null;
    
    if (value.length < 8) return PasswordValidationError.tooShort;
    if (!_regex.hasMatch(value)) {
      if (!value.contains(RegExp(r'[A-Z]'))) return PasswordValidationError.noUpper;
      if (!value.contains(RegExp(r'[a-z]'))) return PasswordValidationError.noLower;
      if (!value.contains(RegExp(r'\d'))) return PasswordValidationError.noNumber;
      if (!value.contains(RegExp(r'[!@#\$&*~]'))) return PasswordValidationError.noSpecial;
    }
    return null;
  }
}