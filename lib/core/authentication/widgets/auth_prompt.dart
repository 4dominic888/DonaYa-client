import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthPrompt extends StatelessWidget {
  final String descriptionText;
  final String linkText;
  final void Function()? onTap;
  const AuthPrompt({
    super.key,
    required this.descriptionText,
    required this.linkText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);
    
    return RichText(
      textScaler: MediaQuery.of(context).textScaler,
      text: TextSpan(
        children: [
          TextSpan(
            text: '$descriptionText ',
            style: themeContext.textTheme.bodyLarge!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: linkText,
            style: themeContext.textTheme.bodyLarge!.copyWith(
              fontSize: 14,
              color: themeContext.colorScheme.onPrimary,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap
          ),
        ],
        style: themeContext.textTheme.bodyMedium,
      ),
    );
  }
}
