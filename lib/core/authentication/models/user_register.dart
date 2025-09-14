import 'package:dona_ya/core/shared/models/contact_info.dart';

abstract class UserRegister {
  final String username;
  final EmailContact email;
  final PhoneNumberContact phone;

  const UserRegister({
    required this.username,
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
    required super.username,
    required super.email,
    required super.phone,
    this.address,
    required this.birthday,
    required this.firstName,
    required this.lastName,
    this.avatar,
  });

  @override
  bool get isValid => username.isNotEmpty &&
        birthday.isAfter(DateTime.now()) &&
        firstName.isNotEmpty && lastName.isNotEmpty;
}