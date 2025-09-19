part of '../login_view.dart';

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