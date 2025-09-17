import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

abstract class AppSnackBar {
  final String title;
  final String message;
  final ContentType contentType;
  const AppSnackBar({required this.title, required this.message, required this.contentType});

  void show(BuildContext context) {
        ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
        backgroundColor: Colors.transparent,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.8,
        ),
        content: AwesomeSnackbarContent(
          title: title,
          message: message,
          contentType: contentType,
        )
      ));
  }
}

class AppErrorSnackBar extends AppSnackBar {
  const AppErrorSnackBar({
    super.title = 'Error',
    required super.message,
  }) : super(contentType: ContentType.failure);
}

class AppSuccessSnackBar extends AppSnackBar {
  const AppSuccessSnackBar({
    super.title = 'Success',
    required super.message,
  }) : super(contentType: ContentType.success);
}

class AppWarningSnackBar extends AppSnackBar {
  const AppWarningSnackBar({
    super.title = 'Warning',
    required super.message,
  }) : super(contentType: ContentType.warning);
}

class AppHelpSnackBar extends AppSnackBar {
  const AppHelpSnackBar({
    super.title = 'Help',
    required super.message,
  }) : super(contentType: ContentType.help);
}