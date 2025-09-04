import 'package:dona_ya/core/shared/flutter_flow_button.dart';
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
    final ffbuttonOptionsDefault = FFButtonOptions(
      color: Theme.of(context).colorScheme.primary,
      textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      elevation: 0,
      borderRadius: BorderRadius.circular(8),
    );

    return FFButtonWidget(
      onPressed: widget.onPressed,
      text: widget.text,
      options: ffbuttonOptionsDefault.merge(widget.options),
    );
  }
}