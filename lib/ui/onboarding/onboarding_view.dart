import 'package:dona_ya/themes/app_color.dart';
import 'package:dona_ya/ui/onboarding/cubits/onboarding_cubit.dart';
import 'package:dona_ya/ui/onboarding/widgets/onboarding_content.dart';
import 'package:dona_ya/ui/onboarding/widgets/onboarding_header.dart';
import 'package:dona_ya/ui/shared/flutter_flow_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  static String routeName = 'onboarding';
  static String routePath = '/onboarding';

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: themeContext.colorScheme.onPrimaryContainer,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const OnboardingHeader(),
                      BlocProvider(
                        create: (context) => OnboardingCubit(),
                        child: const OnboardingContent(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    spacing: 8,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          // context.pushNamed(SignInWidget.routeName);
                        },
                        text: 'Login',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 40,
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: DonaYaColorsNeutral.n100,
                          textStyle: themeContext.textTheme.titleSmall!.copyWith(
                            fontFamily: 'Onest',
                            color: DonaYaColorsNeutral.n10,
                            fontSize: 14,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                          elevation: 0,
                          borderSide: BorderSide(width: 0),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          // context.pushNamed(SignUpWidget.routeName);
                        },
                        text: 'Sign Up',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 40,
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: Color(0x00FFFFFF),
                          textStyle: themeContext.textTheme.titleSmall!.copyWith(
                            fontFamily: 'Onest',
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 14,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                          elevation: 0,
                          borderSide: BorderSide(color: DonaYaColorsNeutral.n50),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
