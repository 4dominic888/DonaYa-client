import 'package:dona_ya/core/authentication/widgets/group_form.dart';
import 'package:dona_ya/core/shared/widgets/app_logos.dart';
import 'package:dona_ya/core/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({ super.key });

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _nameFocusNode = FocusNode();
  final _surnameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _birthdateFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {

    final themeContext = Theme.of(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
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
            padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
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

                            Row(
                              spacing: 20,
                              children: [
                                Expanded(
                                  child: AppTextField(
                                    label: 'Name',
                                    description: 'Enter your name',
                                    focusNode: _nameFocusNode,
                                    icon: const Icon(Icons.person),
                                  ),
                                ),
                                
                                Expanded(
                                  child: AppTextField(
                                    label: 'Surname',
                                    description: 'Enter your surname',
                                    focusNode: _surnameFocusNode,
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
                              focusNode: _emailFocusNode
                            ),

                            AppTextField(
                              label: 'Password',
                              description: 'Enter your password',
                              focusNode: _passwordFocusNode,
                              keyboardType: TextInputType.visiblePassword,
                              isPassword: true,
                              icon: const Icon(Icons.lock),
                            ),

                            const SizedBox(height: 20),

                            const AppTitleText(label: 'Phone and Birthdate'),

                            AppTextField(
                              label: 'Phone',
                              description: 'Enter your phone',
                              focusNode: _phoneFocusNode,
                              icon: const Icon(Icons.phone),
                            ),

                            AppTextField(
                              label: 'Birthdate',
                              description: 'Enter your birthdate',
                              focusNode: _birthdateFocusNode,
                              icon: const Icon(Icons.calendar_today),
                            ),

                          ],
                        )
                      ),
                    )
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

class AppTitleText extends StatelessWidget {

  final String label;

  const AppTitleText({super.key, required this.label});

  @override
  Widget build(BuildContext context) {

    final themeContext = Theme.of(context);

    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(label,
        style: themeContext.textTheme.bodyMedium!.copyWith(
          color: themeContext.colorScheme.primary,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        )
      )
    );
  }
}