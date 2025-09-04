import 'package:flutter/material.dart';

class GroupForm extends StatelessWidget {
  
  final String text;
  final Widget child;

  const GroupForm({
    super.key,
    required this.text,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {

    final themeContext = Theme.of(context);

    return InputDecorator(
      decoration: InputDecoration(
        labelText: text,
        labelStyle: themeContext.textTheme.bodyMedium!.copyWith(
          color: themeContext.colorScheme.primary,
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
        floatingLabelAlignment: FloatingLabelAlignment.center,
        fillColor: themeContext.colorScheme.onSecondaryContainer.withValues(alpha: 0.55),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: themeContext.colorScheme.primary.withAlpha(150),
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: child,
    );
  }
}