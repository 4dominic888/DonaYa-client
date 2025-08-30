import 'package:dona_ya/ui/onboarding/cubits/onboarding_cubit.dart';
import 'package:dona_ya/ui/onboarding/widgets/onboarding_dots.dart';
import 'package:dona_ya/ui/onboarding/widgets/onboarding_page.dart';
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
                      squareImage: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('https://cdn.discordapp.com/attachments/743991659699634296/1410785243484524614/gat.png?ex=68b247a5&is=68b0f625&hm=8bedff4e5795387c8982fb961bb8a0f04ae442f4496de98fd0d37004c64af0d1&'),
                          fit: BoxFit.cover,
                        ),
                      ),
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
