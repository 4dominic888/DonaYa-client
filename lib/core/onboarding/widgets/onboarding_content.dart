import 'package:dona_ya/core/onboarding/bloc/onboarding_cubit.dart';
import 'package:dona_ya/core/onboarding/widgets/onboarding_dots.dart';
import 'package:dona_ya/core/onboarding/widgets/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingContent extends StatefulWidget {
  const OnboardingContent({super.key});

  @override
  State<OnboardingContent> createState() => _OnboardingContentState();
}

class _OnboardingContentState extends State<OnboardingContent> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) => context.read<OnboardingCubit>().setPage(index),
                  scrollDirection: Axis.horizontal,
                  children: [
                    OnboardingPage(
                      title: 'Shop Now, Pay Later',
                      description:
                          'Split your purchases into easy monthly payments with zero interest.',
                    ),
                    OnboardingPage(
                      title: 'Instant Approvals',
                      description:
                          'Get approved within seconds—no paperwork, no waiting.',
                    ),
                    OnboardingPage(
                      title: 'Safe & Secure Payments',
                      description:
                          'Your transactions are encrypted and protected every step of the way.',
                    ),
                  ],
                ),
              ),
              OnboardingDots(pageController: _pageController)
            ],
          ),
        ),
      ),
    );
  }
}
