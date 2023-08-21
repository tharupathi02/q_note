import 'package:flutter/material.dart';
import 'package:q_note/src/constants/colors.dart';

class QNoteTextFieldTheme {

  QNoteTextFieldTheme._();

  static InputDecorationTheme lightTextFieldTheme = const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    prefixIconColor: kSecondaryColor,
    suffixIconColor: kSecondaryColor,
    floatingLabelStyle: TextStyle(color: kSecondaryColor),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kSecondaryColor),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
  );

  static InputDecorationTheme darkTextFieldTheme = const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    prefixIconColor: kPrimaryColor,
    suffixIconColor: kPrimaryColor,
    floatingLabelStyle: TextStyle(color: kPrimaryColor),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kPrimaryColor),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
  );

}