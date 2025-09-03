import 'package:dona_ya/core/onboarding/onboarding_view.dart';
import 'package:dona_ya/router.dart';

class OnboardingRoutes {
  OnboardingRoutes._();

  static const RouterPage onboarding = RouterPage(name: 'onboarding', path: '/onboarding', view: OnboardingView());
}