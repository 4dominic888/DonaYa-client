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

// sealed class PhoneNumberContact {
//   final String countryCode;
//   final String nationalNumber;

//   const PhoneNumberContact(this.countryCode, this.nationalNumber);

//   static PhoneNumberContact? mobile(String nationalNumber) {
//     if (!RegExp(r'^9\d{8}$').hasMatch(nationalNumber)) return null;
//     return MobilePhoneContact("+51", nationalNumber);
//   }

//   static PhoneNumberContact? landline(String nationalNumber) {
//     if (!RegExp(r'^\d{6,8}$').hasMatch(nationalNumber)) return null;
//     return LandlinePhoneContact("+51", nationalNumber);
//   }

//   static PhoneNumberContact? international(String countryCode, String nationalNumber) {
//     if (!RegExp(r'^\+\d{1,3}$').hasMatch(countryCode)) return null;
//     if (!RegExp(r'^\d+$').hasMatch(nationalNumber)) return null;

//     return LandlinePhoneContact("+51", nationalNumber);
//   }

//   //* Phone Number from String
//   static PhoneNumberContact? fromString(String phone) {
//     final match = RegExp(r'^(\+\d{1,3})(\d+)$').firstMatch(phone);
//     if (match == null) return null;

//     final countryCode = match.group(1)!;
//     final nationalNumber = match.group(2)!;

//     if(countryCode.startsWith("+")) {
//       return MobilePhoneContact(countryCode, nationalNumber);
//     }
//     if(nationalNumber.startsWith("9") || nationalNumber.startsWith("0")) {
//       return LandlinePhoneContact(countryCode, nationalNumber);
//     }
//     return InternationalPhoneContact(countryCode, nationalNumber);
//   }

//   @override
//   String toString() => "$countryCode $nationalNumber";
// }

// class MobilePhoneContact extends PhoneNumberContact {
//   final String type = "mobile";
//   const MobilePhoneContact(super.countryCode, super.nationalNumber);
// }

// class LandlinePhoneContact extends PhoneNumberContact {
//   final String type = "landline";
//   const LandlinePhoneContact(super.countryCode, super.nationalNumber);
// }

// class InternationalPhoneContact extends PhoneNumberContact {
//   final String type = "international";
//   const InternationalPhoneContact(super.countryCode, super.nationalNumber);
// }

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