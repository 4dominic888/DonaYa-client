import 'package:dona_ya/core/shared/utils/app_input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/country_picker_dialog.dart';
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
          child: IntlPhoneField(
            decoration: AppInputDecoration(
              text: 'Phone',
              theme: themeContext,
              errorText: widget.onErrorSelected?.message,
              hintText: 'Enter your phone number',
              isDense: false,
              errorMaxLines: null
            ),
            dropdownIcon: const Icon(Icons.phone),
            keyboardType: TextInputType.phone,
            languageCode: 'es',
            showCountryFlag: true,
            buildCounter: (_, {currentLength=0, maxLength, isFocused=true}) => Text(
              '$currentLength/$maxLength',
              style: themeContext.textTheme.labelSmall,
            ),
            pickerDialogStyle: PickerDialogStyle(
              backgroundColor: themeContext.colorScheme.onSecondaryContainer,
              countryCodeStyle: TextStyle(
                color: themeContext.colorScheme.onSecondary
              ),
              countryNameStyle: TextStyle(
                color: themeContext.colorScheme.onPrimary
              ),
              dialogPadding: const EdgeInsets.all(40.0),
              listTileDivider: Divider(
                color: themeContext.colorScheme.onSecondaryContainer,
              ),
              searchFieldInputDecoration: AppInputDecoration(
                text: 'Search',
                theme: themeContext,
                hintText: 'Search for a country',
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            initialCountryCode: 'PE',
            focusNode: focusNode,
            onChanged: widget.onChanged,
          ),
        ),
      ],
    );
  }
}