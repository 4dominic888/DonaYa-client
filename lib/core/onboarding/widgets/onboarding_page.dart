import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    this.squareImage
  });

  final String title;
  final String description;
  final BoxDecoration? squareImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          child: Container(
            width: double.infinity,
            height: 366,
            decoration: squareImage ?? BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondaryContainer
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 32, 20, 0),
          child: Text(title, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 24,
            letterSpacing: 0.0,
            fontWeight: FontWeight.w500,
          ))
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
          child: Text(description, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge),
        ),
      ],
    );
  }
}
