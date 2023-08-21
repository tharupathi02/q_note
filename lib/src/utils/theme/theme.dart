import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:q_note/src/utils/theme/widget_theme/elevated_button_theme.dart';
import 'package:q_note/src/utils/theme/widget_theme/floating_action_button_theme.dart';
import 'package:q_note/src/utils/theme/widget_theme/outline_button_theme.dart';
import 'package:q_note/src/utils/theme/widget_theme/text_field_theme.dart';
import 'package:q_note/src/utils/theme/widget_theme/text_theme.dart';

class QNoteTheme {

  QNoteTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primarySwatch: const MaterialColor(0xFFFFE200, <int, Color>{
      50: Color(0x1AFFE200),
      100: Color(0x33FFE200),
      200: Color(0x4DFFE200),
      300: Color(0x66FFE200),
      400: Color(0x80FFE200),
      500: Color(0xFFFFE200),
      600: Color(0x99FFE200),
      700: Color(0xB3FFE200),
      800: Color(0xCCFFE200),
      900: Color(0xE6FFE200),
    }),
    fontFamily: GoogleFonts.poppins().fontFamily,
    textTheme: QNoteTextTheme.lightTextTheme,
    outlinedButtonTheme: QNoteOutlineButtonTheme.lightOutlineButtonTheme,
    elevatedButtonTheme: QNoteElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: QNoteTextFieldTheme.lightTextFieldTheme,
    floatingActionButtonTheme: QNoteFloatingActionButtonTheme.lightFloatingActionButtonTheme
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,
    textTheme: QNoteTextTheme.darkTextTheme,
    outlinedButtonTheme: QNoteOutlineButtonTheme.darkOutlineButtonTheme,
    elevatedButtonTheme: QNoteElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: QNoteTextFieldTheme.darkTextFieldTheme,
    floatingActionButtonTheme: QNoteFloatingActionButtonTheme.darkFloatingActionButtonTheme
  );
}
