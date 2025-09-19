part of '../login_view.dart';

class _LoginPasswordField extends StatefulWidget {

  final FocusNode focusNode;
  const _LoginPasswordField({ required this.focusNode });

  @override
  State<_LoginPasswordField> createState() => _LoginPasswordFieldState();
}

class _LoginPasswordFieldState extends State<_LoginPasswordField> {

  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {

    final displayError = context.select(
      (LoginBloc bloc) => bloc.state.password.displayError,
    );

    final themeContext = Theme.of(context);
    return Column(
      children: [
        const Align(
          alignment: AlignmentDirectional.centerEnd,
          child: _LoginForgotPasswordField()
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
          child: SizedBox(
            width: double.infinity,
            child: TextField(
              key: Key('fieldForm_passwordInput_textField'),
              focusNode: widget.focusNode,
              onChanged: (password) => EasyDebounce.debounce(
                'password_login_anim',
                Duration(milliseconds: 100),
                () => context.read<LoginBloc>().add(LoginPasswordChanged(password)),
              ),
              keyboardType: TextInputType.visiblePassword,
              obscureText: _isHidden,
              obscuringCharacter: '⏺',
              autofocus: false,
              autofillHints: [AutofillHints.password],
              onEditingComplete: () => TextInput.finishAutofillContext(),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                prefixIconColor: themeContext.colorScheme.primary,
                label: Text('Password', style: TextStyle(color: themeContext.colorScheme.onPrimary)),
                helperStyle: TextStyle(color: themeContext.colorScheme.secondary),
                errorText: displayError?.message,
                hintText: 'Enter your password',
                hintStyle: themeContext.textTheme.labelMedium!.copyWith(
                  //* neutrall600
                  fontWeight: FontWeight.w500,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: themeContext.colorScheme.onSecondaryContainer,
                    width: 1,
                  ),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: themeContext.colorScheme.error,
                    width: 1,
                  ),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: themeContext.colorScheme.error,
                    width: 1,
                  ),
                ),
                filled: true,
                fillColor: HSLColor.fromColor(themeContext.colorScheme.onPrimaryContainer).withLightness(
                  themeContext.brightness == Brightness.light ? 0.92 : 0.08,
                ).toColor(),
                suffixIcon: IconButton(
                  onPressed: () => setState(() => _isHidden = !_isHidden),
                  icon: _isHidden ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                )
              ),
              style: themeContext.textTheme.bodyMedium!.copyWith(
                color: themeContext.colorScheme.onPrimary,
              ),
              cursorColor: themeContext.colorScheme.onPrimary,
            ),
          ),
        )
      ],
    );
  }
}

class _LoginForgotPasswordField extends StatelessWidget {
  const _LoginForgotPasswordField() : super();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        // context.pushNamed(ForgotPasswordWidget.routeName);
      },
      child: Text(
        'Forgot Password?',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.normal,
          color: Theme.of(context).colorScheme.onSecondary,
          fontSize: 14,
          decoration: TextDecoration.underline
        ),
      ),
    );
  }
}