import 'package:flutter_intl_phone_field/phone_number.dart';
import 'package:formz/formz.dart';

enum PhoneValidationError {
  empty('Phone cannot be empty'),
  invalid('Invalid phone format (e.g. +51 987654321)');

  final String message;
  const PhoneValidationError(this.message);
}

class PhoneInput extends FormzInput<String, PhoneValidationError> {
  const PhoneInput.pure() : super.pure('');
  const PhoneInput.dirty(super.value) : super.dirty();

  @override
  PhoneValidationError? validator(String value) {
    late final PhoneNumber phone;
    try {
      phone = PhoneNumber.fromCompleteNumber(completeNumber: value);
    }
    on Exception catch (_) {
      return PhoneValidationError.invalid;
    }
    
    if(phone.completeNumber.isEmpty) return PhoneValidationError.empty;
    if(!phone.isValidNumber()) return PhoneValidationError.invalid;
    return null;
  }
}