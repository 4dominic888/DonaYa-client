part of '../onboarding_view.dart';

class _OnboardingHeader extends StatelessWidget {
  const _OnboardingHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: [
        Image.network(
          DonaYaConstants.appLogo,
          width: 25,
          height: 25,
          fit: BoxFit.cover,
        ),
        Text(
          DonaYaConstants.appName,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w600
          )
        ),
      ],
    );
  }
}
