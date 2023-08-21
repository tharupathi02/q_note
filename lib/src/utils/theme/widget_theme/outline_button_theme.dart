import 'package:flutter/material.dart';
import 'package:q_note/src/constants/colors.dart';
import 'package:q_note/src/constants/sizes.dart';

class QNoteOutlineButtonTheme {
  QNoteOutlineButtonTheme._();

  static final lightOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        foregroundColor: kSecondaryColor,
        side: const BorderSide(color: kSecondaryColor),
        padding: const EdgeInsets.symmetric(vertical: kButtonHeight)
    ),
  );

  static final darkOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        foregroundColor: kWhiteColor,
        side: const BorderSide(color: kWhiteColor),
        padding: const EdgeInsets.symmetric(vertical: kButtonHeight)
    ),
  );
}