import 'package:dona_ya/core/authentication/modules/login/widgets/login_methods_card.dart';
import 'package:dona_ya/core/authentication/modules/login/widgets/login_or_separator.dart';
import 'package:dona_ya/core/authentication/widgets/auth_prompt.dart';
import 'package:dona_ya/core/authentication/widgets/group_form.dart';
import 'package:dona_ya/core/shared/widgets/app_text_field.dart';
import 'package:dona_ya/core/shared/widgets/dona_ya_logo.dart';
import 'package:dona_ya/core/shared/widgets/main_button.dart';
import 'package:dona_ya/core/shared/widgets/flutter_flow_button.dart';
import 'package:dona_ya/core/shared/widgets/snackbars.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'bloc/login_bloc.dart';

part 'widgets/login_password_field.dart';
part 'widgets/login_submit_button.dart';

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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: BlocListener<LoginBloc, LoginState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status.isFailure) {
            AppErrorSnackBar(message: state.error.message).show(context);
          }
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: themeContext.colorScheme.onPrimaryContainer,
          body: SafeArea(
            top: true,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
              
                  const DonaYaLogo(),

                  GroupForm(
                    text: 'Login',
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: AutofillGroup(
                        child: Column(
                          children: [
                        
                            //* Email
                            AppTextField(
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                              label: 'Email',
                              description: 'Enter your email',
                              focusNode: _emailFocusNode,
                              onChanged: (value) => context.read<LoginBloc>().add(LoginEmailChanged(value)),
                              keyboardType: TextInputType.emailAddress,
                              onErrorSelected: emailDisplayError,
                              icon: const Icon(Icons.alternate_email),
                            ),
                        
                            const SizedBox(height: 20),
                        
                            //* Password
                            _LoginPasswordField(
                              focusNode: _passwordFocusNode
                            ),
                        
                            //* Submit Button
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                              child: const _LoginSubmitButton()
                            ),
                        
                            //* Or Separator
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 40),
                              child: const OrSeparator(),
                            ),
                        
                        
                            //* Login Methods
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              spacing: 12,
                              children: [
                                const LoginMethodsCard(
                                  label: 'Google',
                                  iconData: FontAwesomeIcons.google,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  iconColor: Colors.white,
                                ),
                                const LoginMethodsCard(
                                  label: 'Facebook',
                                  iconData: FontAwesomeIcons.facebook,
                                  backgroundColor: Colors.blue,
                                  textColor: Colors.white,
                                  iconColor: Colors.white,
                                )
                              ],
                            ),
                            
                            //* Sign Up Links
                            Align(
                              alignment: AlignmentDirectional(0, -1),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                                child: AuthPrompt(
                                  descriptionText: 'Don\'t have an account? ',
                                  linkText: 'Sign Up',
                                  onTap: () {
                                    // TODO: Implement SignUp
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}