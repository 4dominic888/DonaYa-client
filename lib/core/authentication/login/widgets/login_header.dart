part of '../login_view.dart';

List<Widget> _loginHeader(BuildContext context) {
  final themeContext = Theme.of(context);
  return [  
    Text(
      'Login ',
      style: themeContext.textTheme.titleSmall!.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500
      ),
    ),
    Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
      child: Text(
        'Welcome back! Please log in to continue.',
        style: themeContext.textTheme.bodyMedium!.copyWith(
          fontSize: 14,
          color: themeContext.colorScheme.onSecondary,
          fontWeight: FontWeight.w500,
        ),
      ),
    )
  ];
}