import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBarWidget {
  static void showSnackBar(BuildContext context, String title, String message,
      ContentType contentType) {
    final snackBar = SnackBar(
      elevation: 8.0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: contentType,
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void showSnackBarWithAction(
      BuildContext context,
      String title,
      String message,
      ContentType contentType,
      String actionLabel,
      Function() onPressed) {
    final snackBar = SnackBar(
      elevation: 8.0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: contentType,
      ),
      action: SnackBarAction(
        label: actionLabel,
        onPressed: onPressed,
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void showGetSnackBar(String title, String message) {
    Get.snackbar(title,message, snackPosition: SnackPosition.BOTTOM, margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10));
  }
}
