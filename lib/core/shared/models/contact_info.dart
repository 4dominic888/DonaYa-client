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