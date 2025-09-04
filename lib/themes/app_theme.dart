import 'package:dona_ya/themes/app_color.dart';
import 'package:dona_ya/themes/app_text_theme.dart';
import 'package:flutter/material.dart';

@immutable
class DonaYaColorState extends ThemeExtension<DonaYaColorState> {
  final Color primarySurface;
  final Color primaryBorder;
  final Color primaryHover;
  final Color primaryPressed;
  final Color primaryFocus;

  final Color errorSurface;
  final Color errorBorder;
  final Color errorHover;
  final Color errorPressed;
  final Color errorFocus;

  final Color successSurface;
  final Color successBorder;
  final Color successHover;
  final Color successPressed;
  final Color successFocus;

  final Color warningSurface;
  final Color warningBorder;
  final Color warningHover;
  final Color warningPressed;
  final Color warningFocus;

  final Color infoSurface;
  final Color infoBorder;
  final Color infoHover;
  final Color infoPressed;
  final Color infoFocus;

  const DonaYaColorState({
    required this.primarySurface,
    required this.primaryBorder,
    required this.primaryHover,
    required this.primaryPressed,
    required this.primaryFocus,
    required this.errorSurface,
    required this.errorBorder,
    required this.errorHover,
    required this.errorPressed,
    required this.errorFocus,
    required this.successSurface,
    required this.successBorder,
    required this.successHover,
    required this.successPressed,
    required this.successFocus,
    required this.warningSurface,
    required this.warningBorder,
    required this.warningHover,
    required this.warningPressed,
    required this.warningFocus,
    required this.infoSurface,
    required this.infoBorder,
    required this.infoHover,
    required this.infoPressed,
    required this.infoFocus,
  });

  @override
  DonaYaColorState copyWith({
    Color? primarySurface,
    Color? primaryBorder,
    Color? primaryHover,
    Color? primaryPressed,
    Color? primaryFocus,
    Color? errorSurface,
    Color? errorBorder,
    Color? errorHover,
    Color? errorPressed,
    Color? errorFocus,
    Color? successSurface,
    Color? successBorder,
    Color? successHover,
    Color? successPressed,
    Color? successFocus,
    Color? warningSurface,
    Color? warningBorder,
    Color? warningHover,
    Color? warningPressed,
    Color? warningFocus,
    Color? infoSurface,
    Color? infoBorder,
    Color? infoHover,
    Color? infoPressed,
    Color? infoFocus,
  }) {
    return DonaYaColorState(
      primarySurface: primarySurface ?? this.primarySurface,
      primaryBorder: primaryBorder ?? this.primaryBorder,
      primaryHover: primaryHover ?? this.primaryHover,
      primaryPressed: primaryPressed ?? this.primaryPressed,
      primaryFocus: primaryFocus ?? this.primaryFocus,
      errorSurface: errorSurface ?? this.errorSurface,
      errorBorder: errorBorder ?? this.errorBorder,
      errorHover: errorHover ?? this.errorHover,
      errorPressed: errorPressed ?? this.errorPressed,
      errorFocus: errorFocus ?? this.errorFocus,
      successSurface: successSurface ?? this.successSurface,
      successBorder: successBorder ?? this.successBorder,
      successHover: successHover ?? this.successHover,
      successPressed: successPressed ?? this.successPressed,
      successFocus: successFocus ?? this.successFocus,
      warningSurface: warningSurface ?? this.warningSurface,
      warningBorder: warningBorder ?? this.warningBorder,
      warningHover: warningHover ?? this.warningHover,
      warningPressed: warningPressed ?? this.warningPressed,
      warningFocus: warningFocus ?? this.warningFocus,
      infoSurface: infoSurface ?? this.infoSurface,
      infoBorder: infoBorder ?? this.infoBorder,
      infoHover: infoHover ?? this.infoHover,
      infoPressed: infoPressed ?? this.infoPressed,
      infoFocus: infoFocus ?? this.infoFocus,
    );
  }

  @override
  DonaYaColorState lerp(ThemeExtension<DonaYaColorState>? other, double t) {
    if (other is! DonaYaColorState) return this;
    return DonaYaColorState(
      errorBorder: Color.lerp(errorBorder, other.errorBorder, t)!,
      errorFocus: Color.lerp(errorFocus, other.errorFocus, t)!,
      errorHover: Color.lerp(errorHover, other.errorHover, t)!,
      errorPressed: Color.lerp(errorPressed, other.errorPressed, t)!,
      errorSurface: Color.lerp(errorSurface, other.errorSurface, t)!,
      infoBorder: Color.lerp(infoBorder, other.infoBorder, t)!,
      infoFocus: Color.lerp(infoFocus, other.infoFocus, t)!,
      infoHover: Color.lerp(infoHover, other.infoHover, t)!,
      infoPressed: Color.lerp(infoPressed, other.infoPressed, t)!,
      infoSurface: Color.lerp(infoSurface, other.infoSurface, t)!,
      primaryBorder: Color.lerp(primaryBorder, other.primaryBorder, t)!,
      primaryFocus: Color.lerp(primaryFocus, other.primaryFocus, t)!,
      primaryHover: Color.lerp(primaryHover, other.primaryHover, t)!,
      primaryPressed: Color.lerp(primaryPressed, other.primaryPressed, t)!,
      primarySurface: Color.lerp(primarySurface, other.primarySurface, t)!,
      successBorder: Color.lerp(successBorder, other.successBorder, t)!,
      successFocus: Color.lerp(successFocus, other.successFocus, t)!,
      successHover: Color.lerp(successHover, other.successHover, t)!,
      successPressed: Color.lerp(successPressed, other.successPressed, t)!,
      successSurface: Color.lerp(successSurface, other.successSurface, t)!,
      warningBorder: Color.lerp(warningBorder, other.warningBorder, t)!,
      warningFocus: Color.lerp(warningFocus, other.warningFocus, t)!,
      warningHover: Color.lerp(warningHover, other.warningHover, t)!,
      warningPressed: Color.lerp(warningPressed, other.warningPressed, t)!,
      warningSurface: Color.lerp(warningSurface, other.warningSurface, t)!,
    );
  }
}

const _extraColorsLight = DonaYaColorState(
  primarySurface: Color(0xFFFFF5F5),
  primaryBorder: Color(0xFFFBE4E5),
  primaryHover: Color(0xFFD62828),
  primaryPressed: Color(0xFFB31B23),
  primaryFocus: Color(0xFF7A0C12),
  errorSurface: Color(0xFFFFEBEE),
  errorBorder: Color(0xFFF7BDC1),
  errorHover: Color(0xFFC02F3A),
  errorPressed: Color(0xFF731C23),
  errorFocus: Color(0xFFE63946),
  successSurface: Color(0xFFE7FFF8),
  successBorder: Color(0xFFB5EFD3),
  successHover: Color(0xFF1BAD66),
  successPressed: Color(0xFF10683D),
  successFocus: Color(0xFF21D07A),
  warningSurface: Color(0xFFFFFFE0),
  warningBorder: Color(0xFFFFE1AA),
  warningHover: Color(0xFFD48900),
  warningPressed: Color(0xFF805200),
  warningFocus: Color(0xFFFFA500),
  infoSurface: Color(0xFFE6FDFF),
  infoBorder: Color(0xFFB4DAFF),
  infoHover: Color(0xFF1978D4),
  infoPressed: Color(0xFF1460AA),
  infoFocus: Color(0xFF1E90FF),
);

const _extraColorsDark = DonaYaColorState(
  primarySurface: Color(0xFF1C1C1C),
  primaryBorder: Color(0xFF2E2E2E),
  primaryHover: Color(0xFFFFD54F),
  primaryPressed: Color(0xFFE6C046),
  primaryFocus: Color(0xFFFFE082),
  errorSurface: Color(0xFF2C0B0E),
  errorBorder: Color(0xFF4A1B20),
  errorHover: Color(0xFFE57373),
  errorPressed: Color(0xFFB71C1C),
  errorFocus: Color(0xFFEF5350),
  successSurface: Color(0xFF0D261A),
  successBorder: Color(0xFF1B5E20),
  successHover: Color(0xFF66BB6A),
  successPressed: Color(0xFF2E7D32),
  successFocus: Color(0xFF81C784),
  warningSurface: Color(0xFF332B00),
  warningBorder: Color(0xFF806000),
  warningHover: Color(0xFFFFD54F),
  warningPressed: Color(0xFFD48900),
  warningFocus: Color(0xFFFFE082),
  infoSurface: Color(0xFF0A1C2E),
  infoBorder: Color(0xFF1565C0),
  infoHover: Color(0xFF64B5F6),
  infoPressed: Color(0xFF1976D2),
  infoFocus: Color(0xFF90CAF9),
);

class DonaYaTheme {
  DonaYaTheme._();
  static final light = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: DonaYaColorsLight.primary,
      secondary: DonaYaColorsLight.secondary,
      tertiary: DonaYaColorsLight.tertiary,
      surface: DonaYaColorsNeutral.n50,
      error: DonaYaColorsLight.error,
      onPrimary: DonaYaColorsLight.primaryText,
      onSecondary: DonaYaColorsLight.secondaryText,
      onSurface: DonaYaColorsLight.primaryText,
      onSurfaceVariant: DonaYaColorsNeutral.n90,
      onError: DonaYaColorsLight.error,
      onPrimaryContainer: DonaYaColorsLight.primaryBackground,
      onSecondaryContainer: DonaYaColorsLight.secondaryBackground,
    ),
    extensions: [_extraColorsLight],
    textTheme: DonaYaTextTheme.light
  );

  static final dark = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: DonaYaColorsDark.primary,
      secondary: DonaYaColorsDark.secondary,
      tertiary: DonaYaColorsDark.tertiary,
      surface: DonaYaColorsNeutral.n50,
      error: DonaYaColorsDark.error,
      onPrimary: DonaYaColorsDark.primaryText,
      onSecondary: DonaYaColorsDark.secondaryText,
      onSurface: DonaYaColorsDark.primaryText,
      onSurfaceVariant: DonaYaColorsNeutral.n90,
      onError: DonaYaColorsDark.error,
      onPrimaryContainer: DonaYaColorsDark.primaryBackground,
      onSecondaryContainer: DonaYaColorsDark.secondaryBackground,
    ),
    extensions: [_extraColorsDark],
    textTheme: DonaYaTextTheme.dark
  );
}