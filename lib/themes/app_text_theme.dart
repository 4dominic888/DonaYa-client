import 'package:dona_ya/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DonaYaTextTheme {
  DonaYaTextTheme._();

  static final light = GoogleFonts.onestTextTheme(ThemeData.light().textTheme).copyWith(
    bodySmall: GoogleFonts.onest(fontSize: 12, fontWeight: FontWeight.normal, color: DonaYaColorsLight.primaryText),
    bodyMedium: GoogleFonts.onest(fontSize: 14, fontWeight: FontWeight.normal, color: DonaYaColorsLight.primaryText),
    bodyLarge: GoogleFonts.onest(fontSize: 16, fontWeight: FontWeight.normal, color: DonaYaColorsLight.primaryText),

    labelSmall: GoogleFonts.onest(fontSize: 12, fontWeight: FontWeight.normal, color: DonaYaColorsLight.secondaryText),
    labelMedium: GoogleFonts.onest(fontSize: 14, fontWeight: FontWeight.normal, color: DonaYaColorsLight.secondaryText),
    labelLarge: GoogleFonts.onest(fontSize: 16, fontWeight: FontWeight.normal, color: DonaYaColorsLight.secondaryText),

    titleSmall: GoogleFonts.onest(fontSize: 12, fontWeight: FontWeight.bold, color: DonaYaColorsLight.primaryText),
    titleMedium: GoogleFonts.onest(fontSize: 18, fontWeight: FontWeight.bold, color: DonaYaColorsLight.primaryText),
    titleLarge: GoogleFonts.onest(fontSize: 20, fontWeight: FontWeight.bold, color: DonaYaColorsLight.primaryText),

    headlineSmall: GoogleFonts.onest(fontSize: 24, fontWeight: FontWeight.bold, color: DonaYaColorsLight.primaryText),
    headlineMedium: GoogleFonts.onest(fontSize: 28, fontWeight: FontWeight.bold, color: DonaYaColorsLight.primaryText),
    headlineLarge: GoogleFonts.onest(fontSize: 32, fontWeight: FontWeight.bold, color: DonaYaColorsLight.primaryText),

    displaySmall: GoogleFonts.onest(fontSize: 36, fontWeight: FontWeight.bold, color: DonaYaColorsLight.primaryText),
    displayMedium: GoogleFonts.onest(fontSize: 44, fontWeight: FontWeight.bold, color: DonaYaColorsLight.primaryText),
    displayLarge: GoogleFonts.onest(fontSize: 64, fontWeight: FontWeight.bold, color: DonaYaColorsLight.primaryText),
  );

  static final dark = GoogleFonts.onestTextTheme(ThemeData.dark().textTheme).copyWith(
    bodySmall: GoogleFonts.onest(fontSize: 12, fontWeight: FontWeight.normal, color: DonaYaColorsDark.primaryText),
    bodyMedium: GoogleFonts.onest(fontSize: 14, fontWeight: FontWeight.normal, color: DonaYaColorsDark.primaryText),
    bodyLarge: GoogleFonts.onest(fontSize: 16, fontWeight: FontWeight.normal, color: DonaYaColorsDark.primaryText),

    labelSmall: GoogleFonts.onest(fontSize: 12, fontWeight: FontWeight.normal, color: DonaYaColorsDark.secondaryText),
    labelMedium: GoogleFonts.onest(fontSize: 14, fontWeight: FontWeight.normal, color: DonaYaColorsDark.secondaryText),
    labelLarge: GoogleFonts.onest(fontSize: 16, fontWeight: FontWeight.normal, color: DonaYaColorsDark.secondaryText),

    titleSmall: GoogleFonts.onest(fontSize: 12, fontWeight: FontWeight.bold, color: DonaYaColorsDark.primaryText),
    titleMedium: GoogleFonts.onest(fontSize: 18, fontWeight: FontWeight.bold, color: DonaYaColorsDark.primaryText),
    titleLarge: GoogleFonts.onest(fontSize: 20, fontWeight: FontWeight.bold, color: DonaYaColorsDark.primaryText),

    headlineSmall: GoogleFonts.onest(fontSize: 24, fontWeight: FontWeight.bold, color: DonaYaColorsDark.primaryText),
    headlineMedium: GoogleFonts.onest(fontSize: 28, fontWeight: FontWeight.bold, color: DonaYaColorsDark.primaryText),
    headlineLarge: GoogleFonts.onest(fontSize: 32, fontWeight: FontWeight.bold, color: DonaYaColorsDark.primaryText),

    displaySmall: GoogleFonts.onest(fontSize: 36, fontWeight: FontWeight.bold, color: DonaYaColorsDark.primaryText),
    displayMedium: GoogleFonts.onest(fontSize: 44, fontWeight: FontWeight.bold, color: DonaYaColorsDark.primaryText),
    displayLarge: GoogleFonts.onest(fontSize: 64, fontWeight: FontWeight.bold, color: DonaYaColorsDark.primaryText),
  );
}