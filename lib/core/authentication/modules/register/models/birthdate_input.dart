import 'package:formz/formz.dart';

enum BirthdateValidationError {
  empty('Birthdate cannot be empty'),
  futureDate('Birthdate cannot be in the future'),
  underage('You must be at least 18 years old');

  final String message;
  const BirthdateValidationError(this.message);
}

class BirthdateInput extends FormzInput<DateTime?, BirthdateValidationError> {
  const BirthdateInput.pure() : super.pure(null);
  const BirthdateInput.dirty([super.value]) : super.dirty();

  @override
  BirthdateValidationError? validator(DateTime? value) {
    if(value == null) return BirthdateValidationError.empty;
    
    final today = DateTime.now();
    final minAllowedAge = 18;

    if(value.isAfter(DateTime(today.year - minAllowedAge, today.month, today.day))) {
      return BirthdateValidationError.underage;
    }

    if(value.isAfter(today)) {
      return BirthdateValidationError.futureDate;
    }
    return null;
  }
}