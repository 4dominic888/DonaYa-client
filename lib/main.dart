import 'package:dona_ya/router.dart';
import 'package:dona_ya/themes/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Dona YA',
      theme: DonaYaTheme.light,
      darkTheme: DonaYaTheme.dark,
      routerConfig: DonaYaRouter.router,
      debugShowCheckedModeBanner: false
    );
  }
}