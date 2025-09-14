class EmailContact {
  final String value;

  EmailContact._(this.value);

  factory EmailContact(String input) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+(com|net|org)$');
    if (!regex.hasMatch(input)) {
      throw FormatException('Invalid email format: $input');
    }
    return EmailContact._(input);
  }

  @override
  String toString() => value;
}

sealed class PhoneNumberContact {
  final String countryCode;
  final String nationalNumber;

  const PhoneNumberContact(this.countryCode, this.nationalNumber);

  factory PhoneNumberContact.mobile(String nationalNumber) {
    if (!RegExp(r'^9\d{8}$').hasMatch(nationalNumber)) {
      throw FormatException(
        'Mobile numbers in Peru must start with 9 and have 9 digits',
      );
    }
    return MobilePhoneContact("+51", nationalNumber);
  }

  factory PhoneNumberContact.landline(String nationalNumber) {
    if (!RegExp(r'^\d{6,8}$').hasMatch(nationalNumber)) {
      throw FormatException(
        'Landline numbers in Peru must have 6 to 8 digits',
      );
    }
    return LandlinePhoneContact("+51", nationalNumber);
  }

  factory PhoneNumberContact.international(
    String countryCode,
    String nationalNumber,
  ) {
    if (!RegExp(r'^\+\d{1,3}$').hasMatch(countryCode)) {
      throw FormatException(
        'Invalid country code format (e.g. +1, +44, +51)',
      );
    }
    if (!RegExp(r'^\d+$').hasMatch(nationalNumber)) {
      throw FormatException(
        'International number must contain only digits',
      );
    }
    return InternationalPhoneContact(countryCode, nationalNumber);
  }  
}

class MobilePhoneContact extends PhoneNumberContact {
  final String type = "mobile";
  const MobilePhoneContact(super.countryCode, super.nationalNumber);
}

class LandlinePhoneContact extends PhoneNumberContact {
  final String type = "landline";
  const LandlinePhoneContact(super.countryCode, super.nationalNumber);
}

class InternationalPhoneContact extends PhoneNumberContact {
  final String type = "international";
  const InternationalPhoneContact(super.countryCode, super.nationalNumber);
}

class AddressContact {
  final String street;
  final int? number;
  final String? apartment;
  final String? neighbourhood;
  final String city;
  final String? state;
  final String postalCode;
  final String country;
  final String? reference;

  const AddressContact({
    required this.street,
    this.number,
    this.apartment,
    this.neighbourhood,
    required this.city,
    this.state,
    required this.postalCode,
    required this.country,
    this.reference,
  });
}