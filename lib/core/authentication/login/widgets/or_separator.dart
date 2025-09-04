import 'package:flutter/material.dart';

class OrSeparator extends StatelessWidget {
  const OrSeparator({super.key});


  @override
  Widget build(BuildContext context) {

    final themeContext = Theme.of(context);
    final lineWidget = Expanded(
      child: Container(
        height: 1,
        decoration: BoxDecoration(
          color: themeContext.colorScheme.onSecondary.withValues(alpha: 0.2)
        ),
      ),
    );

    return Row(
      mainAxisSize: MainAxisSize.max,
      spacing: 15,
      children: [
        lineWidget,
        Text(
          'OR',
          style: themeContext.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.normal,
            color: themeContext.colorScheme.onSecondary,
            fontSize: 14,
          ),
        ),
        lineWidget
      ],
    );
  }
}
