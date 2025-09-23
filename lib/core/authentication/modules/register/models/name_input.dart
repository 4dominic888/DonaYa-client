import 'package:formz/formz.dart';

enum NameValidationError {
  empty('Name cannot be empty'),
  tooShort('Name must be at least 2 characters'),
  invalid('Name must contain only letters');

  final String message;
  const NameValidationError(this.message);
}

final _regex = RegExp(r"^[a-zA-ZÀ-ÿ\s'-]+$");

class NameInput extends FormzInput<String, NameValidationError> {
  const NameInput.pure() : super.pure('');
  const NameInput.dirty(super.value) : super.dirty();


  @override
  NameValidationError? validator(String value) {
    if (value.isEmpty) return NameValidationError.empty;
    if (!_regex.hasMatch(value)) return NameValidationError.invalid;
    return null;
  }
}

class SurnameInput extends FormzInput<String, NameValidationError> {
  const SurnameInput.pure() : super.pure('');
  const SurnameInput.dirty(super.value) : super.dirty();

  @override
  NameValidationError? validator(String value) {
    if (value.isEmpty) return NameValidationError.empty;
    if (!_regex.hasMatch(value)) return NameValidationError.invalid;
    return null;
  }
}