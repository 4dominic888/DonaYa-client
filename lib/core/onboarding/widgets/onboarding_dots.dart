part of '../onboarding_view.dart';

class _OnboardingDots extends StatelessWidget {
  const _OnboardingDots({required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 1),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
        child: SmoothPageIndicator(
          controller: pageController,
          count: 3,
          axisDirection: Axis.horizontal,
          onDotClicked: (i) async {
            await pageController.animateToPage(
              i,
              duration: Duration(milliseconds: 500),
              curve: Curves.ease,
            );
            // safeSetState(() {});
          },
          effect: SlideEffect(
            spacing: 8,
            radius: 8,
            dotWidth: 8,
            dotHeight: 8,
            dotColor: DonaYaColorsNeutral.n30,
            activeDotColor: Theme.of(context).colorScheme.primary,
            paintStyle: PaintingStyle.fill,
          ),
        ),
      ),
    );
  }
}