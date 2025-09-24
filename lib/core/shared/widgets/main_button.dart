import 'package:dona_ya/core/shared/widgets/flutter_flow_button.dart';
import 'package:flutter/material.dart';

class MainButton extends StatefulWidget {
  const MainButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.options,
  });

  final String text;
  final Function()? onPressed;
  final FFButtonOptions? options;

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {

    final themeContext = Theme.of(context);

    final ffbuttonOptionsDefault = FFButtonOptions(
      color: themeContext.colorScheme.primary,
      textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: themeContext.brightness == Brightness.dark ? 
          themeContext.colorScheme.onPrimary : themeContext.colorScheme.onPrimaryContainer
      ),
      elevation: 0,
      borderRadius: BorderRadius.circular(8),
      disabledColor: Colors.grey.withAlpha(30),
      disabledTextColor: themeContext.colorScheme.onPrimary.withAlpha(100),
    );

    return FFButtonWidget(
      onPressed: widget.onPressed,
      text: widget.text,
      options: ffbuttonOptionsDefault.merge(widget.options),
    );
  }
}