import 'package:flutter/material.dart';

class AppTitleText extends StatelessWidget {

  final String label;

  const AppTitleText({super.key, required this.label});

  @override
  Widget build(BuildContext context) {

    final themeContext = Theme.of(context);

    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(label,
        style: themeContext.textTheme.bodyMedium!.copyWith(
          color: themeContext.colorScheme.primary,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        )
      )
    );
  }
}