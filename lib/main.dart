import 'package:dona_ya/core/authentication/abstractions/repositories/authentication_repository.dart';
import 'package:dona_ya/core/authentication/abstractions/repositories/user_repository.dart';
import 'package:dona_ya/core/authentication/bloc/authentication_bloc.dart';
import 'package:dona_ya/core/authentication/repositories/mock_auth_repository.dart';
import 'package:dona_ya/core/authentication/repositories/mock_user_repository.dart';
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

    final authRepository = MockAuthRepository();

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (_) => authRepository,
          dispose: (repo) => repo.dispose(),
        ),
        RepositoryProvider<UserRepository>(
          create: (_) => MockUserRepository(authRepository: authRepository),
          dispose: (repo) => repo.dispose(),
        ),
      ],
      child: BlocProvider(
        lazy: false,
        create: (context) => AuthenticationBloc(
          authenticationRepository: context.read<AuthRepository>(),
          userRepository: context.read<UserRepository>(),
        )..add(AuthenticationSubscriptionRequested()),
        child: MaterialApp.router(
          title: 'Dona YA',
          themeMode: ThemeMode.light,
          theme: DonaYaTheme.light,
          darkTheme: DonaYaTheme.dark,
          routerConfig: DonaYaRouter.router,
          debugShowCheckedModeBanner: false
        ),
      ),
    );
  }
}