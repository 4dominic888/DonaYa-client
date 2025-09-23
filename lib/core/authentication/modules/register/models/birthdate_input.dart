import 'package:formz/formz.dart';

enum BirthdateValidationError {
  empty('Birthdate cannot be empty'),
  invalidFormat('Invalid date format (use YYYY-MM-DD)'),
  futureDate('Birthdate cannot be in the future'),
  underage('You must be at least 18 years old');

  final String message;
  const BirthdateValidationError(this.message);
}

class BirthdateInput extends FormzInput<String, BirthdateValidationError> {
  const BirthdateInput.pure() : super.pure('');
  const BirthdateInput.dirty([super.value = '']) : super.dirty();

  static final _regex = RegExp(r'^\d{4}-\d{2}-\d{2}$'); //* YYYY-MM-DD

  @override
  BirthdateValidationError? validator(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return BirthdateValidationError.empty;

    if (!_regex.hasMatch(trimmed)) return BirthdateValidationError.invalidFormat;
    

    final parts = trimmed.split('-');
    final year = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    final day = int.parse(parts[2]);

    //* Validate date coherence
    if (month < 1 || month > 12) return BirthdateValidationError.invalidFormat;
    final lastDayOfMonth = DateTime(year, month + 1, 0).day;
    if (day < 1 || day > lastDayOfMonth) {
      return BirthdateValidationError.invalidFormat;
    }

    final date = DateTime(year, month, day);
    final now = DateTime.now();

    if (date.isAfter(now)) {
      return BirthdateValidationError.futureDate;
    }

    final age = _calculateAge(date, now);
    if (age < 18) {
      return BirthdateValidationError.underage;
    }

    return null;
  }

  int _calculateAge(DateTime birthDate, DateTime now) {
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }
}