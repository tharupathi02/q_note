import 'package:flutter/material.dart';
import 'package:q_note/src/constants/colors.dart';
import 'package:q_note/src/constants/sizes.dart';


class QNoteElevatedButtonTheme {
  QNoteElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        foregroundColor: kWhiteColor,
        backgroundColor: kSecondaryColor,
        side: const BorderSide(color: kSecondaryColor),
        padding: const EdgeInsets.symmetric(vertical: kButtonHeight)
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        foregroundColor: kSecondaryColor,
        backgroundColor: kWhiteColor,
        side: const BorderSide(color: kSecondaryColor),
        padding: const EdgeInsets.symmetric(vertical: kButtonHeight)
    ),
  );
}