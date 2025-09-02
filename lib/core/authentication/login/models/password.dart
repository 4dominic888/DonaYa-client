import 'package:formz/formz.dart';

enum PasswordValidationError { tooShort, noUpper, noLower, noNumber, noSpecial }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();

  static final _regex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~])[A-Za-z\d!@#\$&*~]{8,}$'
  );

  @override
  PasswordValidationError? validator(String value) {
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