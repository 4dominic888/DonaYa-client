import 'package:dona_ya/themes/app_theme.dart';
import 'package:dona_ya/ui/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dona YA',
      theme: DonaYaTheme.light,
      darkTheme: DonaYaTheme.dark,
      home: const OnboardingView(),
      debugShowCheckedModeBanner: false
    );
  }
}