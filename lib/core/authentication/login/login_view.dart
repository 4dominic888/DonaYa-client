import 'package:dona_ya/core/shared/flutter_flow_button.dart';
import 'package:dona_ya/themes/app_color.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';

import 'bloc/login_bloc.dart';

part 'widgets/login_header.dart';
part 'widgets/login_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);

    final emailDisplayError = context.select((LoginBloc bloc) => bloc.state.email.displayError);
    final passwordDisplayError = context.select((LoginBloc bloc) => bloc.state.password.displayError);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(content: Text('Authentication Failure')),
              );
          }
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: themeContext.colorScheme.onPrimaryContainer,
          body: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ..._loginHeader(context),

                  _LoginField(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                    label: 'Email',
                    description: 'Enter your email',
                    focusNode: _emailFocusNode,
                    onChanged: (value) => context.read<LoginBloc>().add(LoginEmailChanged(value)),
                    onErrorSelected: emailDisplayError,
                  ),

                  _LoginField(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    label: 'Password',
                    description: 'Enter your password',
                    focusNode: _passwordFocusNode,
                    onChanged: (value) => context.read<LoginBloc>().add(LoginPasswordChanged(value)),
                    onErrorSelected: passwordDisplayError,
                    additionalWidget: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        // context.pushNamed(ForgotPasswordWidget.routeName);
                      },
                      child: Text(
                        'Forgot Password?',
                        style: themeContext.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.normal,
                          color: themeContext.colorScheme.onSecondary,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        // context.pushNamed(HomePageWidget.routeName);
                      },
                      text: 'Continue',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40,
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: DonaYaColorsNeutral.n100,
                        textStyle: themeContext.textTheme.titleSmall!.copyWith(
                          fontSize: 14,
                          color: DonaYaColorsNeutral.n10,
                          fontWeight: FontWeight.w500,
                        ),
                        elevation: 0,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 40),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            decoration: BoxDecoration(
                              color: DonaYaColorsNeutral.n30,
                            ),
                          ),
                        ),
                        Text(
                          'OR',
                          style: themeContext.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.normal,
                            color: themeContext.colorScheme.onSecondary,
                            fontSize: 14,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            decoration: BoxDecoration(
                              color: DonaYaColorsNeutral.n30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    spacing: 12,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: DonaYaColorsNeutral.n30),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              0,
                              10,
                              0,
                              10,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 10,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.google,
                                  color: themeContext.colorScheme.onPrimary,
                                  size: 24,
                                ),
                                Text(
                                  'Google',
                                  style: themeContext.textTheme.bodyMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: DonaYaColorsNeutral.n30),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              0,
                              10,
                              0,
                              10,
                            ),
                            child: Row(
                              spacing: 10,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.apple,
                                  color: themeContext.colorScheme.onPrimary,
                                  size: 24,
                                ),
                                Text(
                                  'Apple',
                                  style: themeContext.textTheme.bodyMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, -1),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                      child: RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Don\'t have an account? ',
                              style: themeContext.textTheme.bodyMedium!
                                  .copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            TextSpan(
                              text: 'Sign Up ',
                              style: themeContext.textTheme.bodyMedium!
                                  .copyWith(
                                    fontSize: 14,
                                    color: themeContext.colorScheme.onPrimary,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                          style: themeContext.textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
