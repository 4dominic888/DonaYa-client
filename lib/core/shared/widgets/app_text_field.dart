import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {

  final String label;
  final String description;
  final FocusNode focusNode;
  final EdgeInsetsGeometry? padding;
  final Widget? additionalWidget;
  final void Function(String fieldValue)? onChanged;
  final dynamic onErrorSelected;
  final TextInputType? keyboardType;
  final Widget? icon;

  const AppTextField({
    super.key,
    required this.label,
    required this.description,
    required this.focusNode,
    this.padding,
    this.onErrorSelected,
    this.additionalWidget,
    this.onChanged,
    this.keyboardType,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
          child: SizedBox(
            width: double.infinity,
            child: TextField(
              key: Key('fieldForm_${label}Input_textField'),
              focusNode: focusNode,
              onChanged: (value) => EasyDebounce.debounce(
                '${label}_${description}_anim',
                Duration(milliseconds: 100),
                () => onChanged?.call(value),
              ),
              keyboardType: keyboardType,
              autofocus: false,
              decoration: InputDecoration(
                label: Text(label, style: TextStyle(color: themeContext.colorScheme.onPrimary)),
                helperStyle: TextStyle(color: themeContext.colorScheme.secondary),
                errorText: onErrorSelected?.message,
                hintText: description,
                hintStyle: themeContext.textTheme.labelMedium!.copyWith(
                  //* neutrall600
                  fontWeight: FontWeight.w500,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: themeContext.colorScheme.onSecondaryContainer,
                    width: 1,
                  ),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: themeContext.colorScheme.error,
                    width: 1,
                  ),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: themeContext.colorScheme.error,
                    width: 1,
                  ),
                ),
                filled: true,
                prefixIcon: icon,
                prefixIconColor: themeContext.colorScheme.primary,
                fillColor: HSLColor.fromColor(themeContext.colorScheme.onPrimaryContainer).withLightness(
                  themeContext.brightness == Brightness.light ? 0.92 : 0.08,
                ).toColor(),
              ),
              style: themeContext.textTheme.bodyMedium!.copyWith(
                color: themeContext.colorScheme.onPrimary,
              ),
              cursorColor: themeContext.colorScheme.onPrimary
            ),
          ),
        )
      ],
    );
  }
}

