import 'package:date_field/date_field.dart';
import 'package:dona_ya/core/shared/utils/app_input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppDateField extends StatefulWidget {

  final String label;
  final String description;
  final void Function(DateTime?)? onChanged;
  final dynamic onErrorSelected;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final Widget? icon;

  const AppDateField({
    super.key,
    this.label = 'Date',
    this.description = 'Enter your date',
    this.onChanged,
    required this.onErrorSelected,
    this.firstDate,
    this.lastDate,
    this.icon,
  });

  @override
  State<AppDateField> createState() => _AppDateFieldState();
}

class _AppDateFieldState extends State<AppDateField> {

  final _focusNode = FocusNode();
  DateTime? _value; 

  @override
  Widget build(BuildContext context) {

    final themeContext = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
          child: SizedBox(
            width: double.infinity,
            child: DateTimeField(
              focusNode: _focusNode,
              decoration: AppInputDecoration(
                text: widget.label,
                theme: themeContext,
                errorText: widget.onErrorSelected?.message,
                hintText: widget.description,
                prefixIcon: widget.icon,
                isDense: false,
                errorMaxLines: null
              ),
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = value;
                  widget.onChanged?.call(value);
                });
              },
              dateFormat: DateFormat('dd/MM/yyyy'),
              materialDatePickerOptions: MaterialDatePickerOptions(
                fieldHintText: '(e.g. 20/06/2000)',
              ),
              mode: DateTimeFieldPickerMode.date,
              firstDate: widget.firstDate,
              lastDate: widget.lastDate,
            ),
          ),
        ),
      ],
    );
  }
}