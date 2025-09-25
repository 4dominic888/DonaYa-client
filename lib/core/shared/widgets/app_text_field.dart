import 'package:dona_ya/core/shared/utils/app_input_decoration.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatefulWidget {

  final String label;
  final String description;
  final FocusNode focusNode;
  final EdgeInsetsGeometry? padding;
  final Widget? additionalWidget;
  final void Function(String fieldValue)? onChanged;
  final dynamic onErrorSelected;
  final TextInputType? keyboardType;
  final Widget? icon;
  final bool isPassword;
  final List<TextInputFormatter>? inputFormatters;

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
    this.isPassword = false,
    this.inputFormatters,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {

  late bool _isHidden;

  @override
  void initState() {
    super.initState();
    _isHidden = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: widget.additionalWidget
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
          child: SizedBox(
            width: double.infinity,
            child: TextField(
              key: Key('fieldForm_${widget.label}Input_textField'),
              focusNode: widget.focusNode,
              obscuringCharacter: '⏺',
              inputFormatters: widget.inputFormatters,
              autofillHints: widget.isPassword ? [AutofillHints.password] : null,
              onEditingComplete: () => TextInput.finishAutofillContext(),
              onChanged: (value) => EasyDebounce.debounce(
                '${widget.label}_${widget.description}_anim',
                Duration(milliseconds: 100),
                () => widget.onChanged?.call(value),
              ),
              keyboardType: widget.keyboardType,
              obscureText: _isHidden,
              autofocus: false,
              decoration: AppInputDecoration(
                text: widget.label,
                theme: themeContext,
                errorText: widget.onErrorSelected?.message,
                hintText: widget.description,
                prefixIcon: widget.icon,
                suffixIcon: widget.isPassword ? IconButton(
                  onPressed: () => setState(() => _isHidden = !_isHidden),
                  icon: _isHidden ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                ) : null
              ),
              cursorColor: themeContext.colorScheme.onPrimary
            ),
          ),
        )
      ],
    );
  }
}

