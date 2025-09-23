import 'package:flutter/material.dart';

class AppInputDecoration extends InputDecoration {

  AppInputDecoration({
    required String text,
    required ThemeData theme,
    super.errorText,
    super.hintText,
    super.prefixIcon,
    super.suffixIcon,
    super.error,
    super.errorStyle,
    super.border,
    super.floatingLabelBehavior,
    super.floatingLabelAlignment,
    super.isDense,
    super.contentPadding,
    super.isCollapsed,
    super.iconColor,
    super.prefixStyle,
    super.prefixIconConstraints,
    super.suffixStyle,
    super.suffixIconColor,
    super.suffixIconConstraints,
    super.counterStyle,
    super.counterText,
    super.counter,
    super.visualDensity,
    super.constraints,
    super.labelStyle,
    super.labelText,
    super.helperMaxLines,
    super.helperText,
    super.hintMaxLines,
    super.errorMaxLines,
    super.alignLabelWithHint,
    super.semanticCounterText,
    super.suffix,
    super.focusColor,
    super.hoverColor,
    super.enabled,
    super.disabledBorder,
    super.floatingLabelStyle,
    super.helper,
    super.hint,
    super.hintFadeDuration,
    super.hintTextDirection,
    super.icon,
    super.maintainHintSize,
    super.prefix,
    super.prefixText,
    super.suffixText


  }) : super(
    label: Text(text, style: TextStyle(color: theme.colorScheme.primary.withAlpha(190))),
    helperStyle: TextStyle(color: theme.colorScheme.secondary),
    hintStyle: theme.textTheme.labelMedium!.copyWith(
      fontWeight: FontWeight.w500
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0x00000000),
        width: 1,
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: theme.colorScheme.onSecondaryContainer,
        width: 1,
      ),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: theme.colorScheme.error,
        width: 1,
      ),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: theme.colorScheme.error,
        width: 1,
      ),
    ),
    filled: true,
    prefixIconColor: theme.colorScheme.primary,
    fillColor: HSLColor.fromColor(theme.colorScheme.onPrimaryContainer).withLightness(
      theme.brightness == Brightness.light ? 0.92 : 0.08,
    ).toColor(),
  );

}