import 'package:dona_ya/core/authentication/authentication_routes.dart';
import 'package:dona_ya/core/onboarding/onboarding_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterPage {
  final String name;
  final String path;
  final Widget view;

  const RouterPage({required this.name, required this.path, required this.view});
}

class DonaYaRouter {
  DonaYaRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: OnboardingRoutes.onboarding.path,
    routes: [
      GoRoute(
        path: OnboardingRoutes.onboarding.path,
        name: OnboardingRoutes.onboarding.name,
        builder: (context, state) => OnboardingRoutes.onboarding.view,
      ),
      GoRoute(
        path: AuthenticationRoutes.login.path,
        name: AuthenticationRoutes.login.name,
        builder: (context, state) => AuthenticationRoutes.login.view,
      )
    ],
  );
}