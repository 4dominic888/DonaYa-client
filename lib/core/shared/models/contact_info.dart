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