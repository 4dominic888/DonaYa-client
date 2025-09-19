import 'package:dona_ya/core/shared/models/contact_info.dart';

abstract class UserRegister {
  final EmailContact email;
  final PhoneNumberContact phone;
  String get name;

  const UserRegister({
    required this.email,
    required this.phone,
  });
  
  bool get isValid;
}

class CustomUserRegister extends UserRegister {

  final AddressContact? address;
  final DateTime birthday;
  final String firstName;
  final String lastName;
  final String? avatar;

  CustomUserRegister({
    required super.email,
    required super.phone,
    this.address,
    required this.birthday,
    required this.firstName,
    required this.lastName,
    this.avatar,
  });

  @override
  bool get isValid => birthday.isAfter(DateTime.now()) && firstName.isNotEmpty && lastName.isNotEmpty;

  @override
  String get name => '$firstName $lastName';
}