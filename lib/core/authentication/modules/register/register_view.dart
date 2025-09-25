import 'package:dona_ya/core/authentication/modules/login/widgets/login_methods_card.dart';
import 'package:dona_ya/core/authentication/modules/login/widgets/login_or_separator.dart';
import 'package:dona_ya/core/authentication/modules/register/bloc/register_bloc.dart';
import 'package:dona_ya/core/authentication/modules/register/widgets/app_title_text.dart';
import 'package:dona_ya/core/authentication/modules/register/widgets/phone_field.dart';
import 'package:dona_ya/core/authentication/widgets/group_form.dart';
import 'package:dona_ya/core/shared/widgets/app_date_field.dart';
import 'package:dona_ya/core/shared/widgets/app_logos.dart';
import 'package:dona_ya/core/shared/widgets/app_text_field.dart';
import 'package:dona_ya/core/shared/widgets/flutter_flow_button.dart';
import 'package:dona_ya/core/shared/widgets/main_button.dart';
import 'package:dona_ya/core/shared/widgets/snackbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

part 'widgets/register_submit_button.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _nameFocusNode = FocusNode();
  final _surnameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);

    final nameDisplayError = context.select(
      (RegisterBloc bloc) => bloc.state.name.displayError,
    );
    final surnameDisplayError = context.select(
      (RegisterBloc bloc) => bloc.state.surname.displayError,
    );
    final emailDisplayError = context.select(
      (RegisterBloc bloc) => bloc.state.email.displayError,
    );
    final passwordDisplayError = context.select(
      (RegisterBloc bloc) => bloc.state.password.displayError,
    );
    final phoneDisplayError = context.select(
      (RegisterBloc bloc) => bloc.state.phone.displayError,
    );
    final birthdateDisplayError = context.select(
      (RegisterBloc bloc) => bloc.state.birthdate.displayError,
    );

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: BlocListener<RegisterBloc, RegisterState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status.isFailure) {
            AppErrorSnackBar(message: state.error.message).show(context);
          }
        },
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            elevation: 0,
            animateColor: false,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.pop(),
            ),
          ),
          backgroundColor: themeContext.colorScheme.onPrimaryContainer,
          body: SafeArea(
            top: true,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 30),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    const DonaYaLogo(size: 55),

                    GroupForm(
                      text: 'Register',
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: AutofillGroup(
                          child: Column(
                            children: [
                              const DefaultUserLogo(size: 180),

                              const AppTitleText(label: 'Full name'),

                              //* Full name
                              Row(
                                spacing: 20,
                                children: [
                                  Expanded(
                                    child: AppTextField(
                                      label: 'Name',
                                      description: 'Enter your name',
                                      focusNode: _nameFocusNode,
                                      onChanged:
                                          (value) =>
                                              context.read<RegisterBloc>().add(
                                                RegisterFirstNameChanged(value),
                                              ),
                                      onErrorSelected: nameDisplayError,
                                      icon: const Icon(Icons.person),
                                    ),
                                  ),

                                  Expanded(
                                    child: AppTextField(
                                      label: 'Surname',
                                      description: 'Enter your surname',
                                      focusNode: _surnameFocusNode,
                                      onChanged:
                                          (value) =>
                                              context.read<RegisterBloc>().add(
                                                RegisterSurnameChanged(value),
                                              ),
                                      onErrorSelected: surnameDisplayError,
                                      icon: const Icon(Icons.person),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 20),

                              const AppTitleText(label: 'Email and Password'),

                              AppTextField(
                                label: 'Email',
                                description: 'Enter your email',
                                icon: const Icon(Icons.alternate_email),
                                onChanged:
                                    (value) => context.read<RegisterBloc>().add(
                                      RegisterEmailChanged(value),
                                    ),
                                onErrorSelected: emailDisplayError,
                                focusNode: _emailFocusNode,
                              ),

                              AppTextField(
                                label: 'Password',
                                description: 'Enter your password',
                                focusNode: _passwordFocusNode,
                                keyboardType: TextInputType.visiblePassword,
                                onChanged:
                                    (value) => context.read<RegisterBloc>().add(
                                      RegisterPasswordChanged(value),
                                    ),
                                onErrorSelected: passwordDisplayError,
                                isPassword: true,
                                icon: const Icon(Icons.lock),
                              ),

                              const SizedBox(height: 20),

                              const AppTitleText(label: 'Phone and Birthdate'),

                              PhoneField(
                                onChanged:
                                    (value) => context.read<RegisterBloc>().add(
                                      RegisterPhoneChanged(value),
                                    ),
                                onErrorSelected: phoneDisplayError,
                              ),

                              AppDateField(
                                label: 'Birthdate (dd/MM/yyyy)',
                                description: 'Enter your birthdate',
                                onChanged:
                                    (value) => context.read<RegisterBloc>().add(
                                      RegisterBirthdateChanged(value),
                                    ),
                                onErrorSelected: birthdateDisplayError,
                                icon: const Icon(Icons.calendar_today),
                                firstDate: DateTime(1900, 1, 1),
                                lastDate: DateTime.now().subtract(
                                  const Duration(days: 365 * 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Center(child: const _RegisterSubmitButton()),

                    const SizedBox(height: 10),

                    OrSeparator(),

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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
