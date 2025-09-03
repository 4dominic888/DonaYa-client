import 'package:dona_ya/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DonaYaTextTheme {
  DonaYaTextTheme._();

  static final light = GoogleFonts.onestTextTheme(ThemeData.light().textTheme).copyWith(
    bodySmall: GoogleFonts.onest(fontSize: 12, fontWeight: FontWeight.normal, color: DonaYaColorsLight.primaryText, textStyle: const TextStyle(color: DonaYaColorsLight.primaryText)),
    bodyMedium: GoogleFonts.onest(fontSize: 14, fontWeight: FontWeight.normal, color: DonaYaColorsLight.primaryText, textStyle: const TextStyle(color: DonaYaColorsLight.primaryText)),
    bodyLarge: GoogleFonts.onest(fontSize: 16, fontWeight: FontWeight.normal, color: DonaYaColorsLight.primaryText, textStyle: const TextStyle(color: DonaYaColorsLight.primaryText)),

    labelSmall: GoogleFonts.onest(fontSize: 12, fontWeight: FontWeight.normal, color: DonaYaColorsLight.secondaryText, textStyle: const TextStyle(color: DonaYaColorsLight.secondaryText)),
    labelMedium: GoogleFonts.onest(fontSize: 14, fontWeight: FontWeight.normal, color: DonaYaColorsLight.secondaryText, textStyle: const TextStyle(color: DonaYaColorsLight.secondaryText)),
    labelLarge: GoogleFonts.onest(fontSize: 16, fontWeight: FontWeight.normal, color: DonaYaColorsLight.secondaryText, textStyle: const TextStyle(color: DonaYaColorsLight.secondaryText)),

    titleSmall: GoogleFonts.onest(fontSize: 12, fontWeight: FontWeight.bold, color: DonaYaColorsLight.primaryText, textStyle: const TextStyle(color: DonaYaColorsLight.primaryText)),
    titleMedium: GoogleFonts.onest(fontSize: 18, fontWeight: FontWeight.bold, color: DonaYaColorsLight.primaryText, textStyle: const TextStyle(color: DonaYaColorsLight.primaryText)),
    titleLarge: GoogleFonts.onest(fontSize: 20, fontWeight: FontWeight.bold, color: DonaYaColorsLight.primaryText, textStyle: const TextStyle(color: DonaYaColorsLight.primaryText)),

    headlineSmall: GoogleFonts.onest(fontSize: 24, fontWeight: FontWeight.bold, color: DonaYaColorsLight.primaryText, textStyle: const TextStyle(color: DonaYaColorsLight.primaryText)),
    headlineMedium: GoogleFonts.onest(fontSize: 28, fontWeight: FontWeight.bold, color: DonaYaColorsLight.primaryText, textStyle: const TextStyle(color: DonaYaColorsLight.primaryText)),
    headlineLarge: GoogleFonts.onest(fontSize: 32, fontWeight: FontWeight.bold, color: DonaYaColorsLight.primaryText, textStyle: const TextStyle(color: DonaYaColorsLight.primaryText)),

    displaySmall: GoogleFonts.onest(fontSize: 36, fontWeight: FontWeight.bold, color: DonaYaColorsLight.primaryText, textStyle: const TextStyle(color: DonaYaColorsLight.primaryText)),
    displayMedium: GoogleFonts.onest(fontSize: 44, fontWeight: FontWeight.bold, color: DonaYaColorsLight.primaryText, textStyle: const TextStyle(color: DonaYaColorsLight.primaryText)),
    displayLarge: GoogleFonts.onest(fontSize: 64, fontWeight: FontWeight.bold, color: DonaYaColorsLight.primaryText, textStyle: const TextStyle(color: DonaYaColorsLight.primaryText)),
  );

  static final dark = GoogleFonts.onestTextTheme(ThemeData.dark().textTheme).copyWith( 
    bodySmall: GoogleFonts.onest(fontSize: 12, fontWeight: FontWeight.normal, color: DonaYaColorsDark.primaryText, textStyle: const TextStyle(color: DonaYaColorsDark.primaryText)),
    bodyMedium: GoogleFonts.onest(fontSize: 14, fontWeight: FontWeight.normal, color: DonaYaColorsDark.primaryText, textStyle: const TextStyle(color: DonaYaColorsDark.primaryText)),
    bodyLarge: GoogleFonts.onest(fontSize: 16, fontWeight: FontWeight.normal, color: DonaYaColorsDark.primaryText, textStyle: const TextStyle(color: DonaYaColorsDark.primaryText)),

    labelSmall: GoogleFonts.onest(fontSize: 12, fontWeight: FontWeight.normal, color: DonaYaColorsDark.secondaryText, textStyle: const TextStyle(color: DonaYaColorsDark.secondaryText)),
    labelMedium: GoogleFonts.onest(fontSize: 14, fontWeight: FontWeight.normal, color: DonaYaColorsDark.secondaryText, textStyle: const TextStyle(color: DonaYaColorsDark.secondaryText)),
    labelLarge: GoogleFonts.onest(fontSize: 16, fontWeight: FontWeight.normal, color: DonaYaColorsDark.secondaryText, textStyle: const TextStyle(color: DonaYaColorsDark.secondaryText)),

    titleSmall: GoogleFonts.onest(fontSize: 12, fontWeight: FontWeight.bold, color: DonaYaColorsDark.primaryText, textStyle: const TextStyle(color: DonaYaColorsDark.primaryText)),
    titleMedium: GoogleFonts.onest(fontSize: 18, fontWeight: FontWeight.bold, color: DonaYaColorsDark.primaryText, textStyle: const TextStyle(color: DonaYaColorsDark.primaryText)),
    titleLarge: GoogleFonts.onest(fontSize: 20, fontWeight: FontWeight.bold, color: DonaYaColorsDark.primaryText, textStyle: const TextStyle(color: DonaYaColorsDark.primaryText)),

    headlineSmall: GoogleFonts.onest(fontSize: 24, fontWeight: FontWeight.bold, color: DonaYaColorsDark.primaryText, textStyle: const TextStyle(color: DonaYaColorsDark.primaryText)),
    headlineMedium: GoogleFonts.onest(fontSize: 28, fontWeight: FontWeight.bold, color: DonaYaColorsDark.primaryText, textStyle: const TextStyle(color: DonaYaColorsDark.primaryText)),
    headlineLarge: GoogleFonts.onest(fontSize: 32, fontWeight: FontWeight.bold, color: DonaYaColorsDark.primaryText, textStyle: const TextStyle(color: DonaYaColorsDark.primaryText)),

    displaySmall: GoogleFonts.onest(fontSize: 36, fontWeight: FontWeight.bold, color: DonaYaColorsDark.primaryText, textStyle: const TextStyle(color: DonaYaColorsDark.primaryText)),
    displayMedium: GoogleFonts.onest(fontSize: 44, fontWeight: FontWeight.bold, color: DonaYaColorsDark.primaryText, textStyle: const TextStyle(color: DonaYaColorsDark.primaryText)),
    displayLarge: GoogleFonts.onest(fontSize: 64, fontWeight: FontWeight.bold, color: DonaYaColorsDark.primaryText, textStyle: const TextStyle(color: DonaYaColorsDark.primaryText)),
  );
}