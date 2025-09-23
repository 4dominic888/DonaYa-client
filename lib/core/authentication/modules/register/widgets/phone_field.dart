import 'package:dona_ya/core/shared/utils/app_input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:flutter_intl_phone_field/phone_number.dart';

class PhoneField extends StatefulWidget {

  final void Function(PhoneNumber)? onChanged;
  final dynamic onErrorSelected;

  const PhoneField({
    super.key,
    this.onChanged,
    required this.onErrorSelected,
  });

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {

  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {

    final themeContext = Theme.of(context);

    return IntlPhoneField(
      decoration: AppInputDecoration(
        text: 'Phone',
        theme: themeContext,
        errorText: widget.onErrorSelected?.message,
        hintText: 'Enter your phone number',
        prefixIcon: const Icon(Icons.phone),
      ),
      initialCountryCode: 'PE',
      focusNode: focusNode,
      onChanged: widget.onChanged,
    );
  }
}