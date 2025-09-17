import 'package:dona_ya/core/authentication/abstractions/repositories/auth_service.dart';
import 'package:dona_ya/core/authentication/bloc/authentication_bloc.dart';
import 'package:dona_ya/core/authentication/infrastructure/mock_auth_service.dart';
import 'package:dona_ya/router.dart';
import 'package:dona_ya/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthService>(
          create: (_) => MockAuthService(),
          dispose: (service) => service.dispose(),
        ),
      ],
      child: BlocProvider(
        lazy: false,
        create: (context) => AuthenticationBloc(
          authenticationService: context.read<AuthService>(),
        )..add(AuthenticationSubscriptionRequested()),
        child: MaterialApp.router(
          title: 'Dona YA',
          themeMode: ThemeMode.dark,
          theme: DonaYaTheme.light,
          darkTheme: DonaYaTheme.dark,
          routerConfig: DonaYaRouter.router,
          debugShowCheckedModeBanner: false
        ),
      ),
    );
  }
}