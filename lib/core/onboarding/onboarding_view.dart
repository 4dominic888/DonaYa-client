import 'package:dona_ya/core/authentication/authentication_routes.dart';
import 'package:dona_ya/core/shared/dona_ya_logo.dart';
import 'package:dona_ya/core/shared/main_button.dart';
import 'package:dona_ya/themes/app_color.dart';
import 'package:dona_ya/core/onboarding/bloc/onboarding_cubit.dart';
import 'package:dona_ya/core/shared/flutter_flow_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

part 'widgets/onboarding_content.dart';
part 'widgets/onboarding_dots.dart';
part 'widgets/onboarding_page.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

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
                      const DonaYaLogo(size: 60),
                      BlocProvider(
                        create: (context) => OnboardingCubit(),
                        child: const _OnboardingContent(),
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

                      MainButton(
                        onPressed: () => context.go(AuthenticationRoutes.login.path),
                        text: 'Login',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 40,
                          color: themeContext.colorScheme.primary,
                          textStyle: themeContext.textTheme.bodyMedium!.copyWith(
                            fontFamily: 'Onest',
                            color: themeContext.colorScheme.onPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ),

                      MainButton(
                        onPressed: () async {
                          // context.pushNamed(SignUpWidget.routeName);
                        },
                        text: 'Sign Up',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 40,
                          color: themeContext.colorScheme.secondary,
                          textStyle: themeContext.textTheme.bodyMedium!.copyWith(
                            fontFamily: 'Onest',
                            color: themeContext.colorScheme.onPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      )
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
