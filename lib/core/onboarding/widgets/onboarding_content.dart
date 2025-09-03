

part of '../onboarding_view.dart';

class _OnboardingContent extends StatefulWidget {
  const _OnboardingContent();

  @override
  State<_OnboardingContent> createState() => _OnboardingContentState();
}

class _OnboardingContentState extends State<_OnboardingContent> {
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
                    _OnboardingPage(
                      title: 'Shop Now, Pay Later',
                      description:
                          'Split your purchases into easy monthly payments with zero interest.',
                    ),
                    _OnboardingPage(
                      title: 'Instant Approvals',
                      description:
                          'Get approved within seconds—no paperwork, no waiting.',
                    ),
                    _OnboardingPage(
                      title: 'Safe & Secure Payments',
                      description:
                          'Your transactions are encrypted and protected every step of the way.',
                    ),
                  ],
                ),
              ),
              _OnboardingDots(pageController: _pageController)
            ],
          ),
        ),
      ),
    );
  }
}
