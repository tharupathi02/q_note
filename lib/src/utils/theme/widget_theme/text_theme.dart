import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:q_note/src/constants/colors.dart';

class QNoteTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
        fontSize: 28.0, fontWeight: FontWeight.bold, color: kDarkColor),
    displayMedium: GoogleFonts.poppins(
        fontSize: 24.0, fontWeight: FontWeight.w700, color: kDarkColor),
    displaySmall: GoogleFonts.poppins(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: kDarkColor),
    bodyLarge: GoogleFonts.poppins(
        fontSize: 16.0, fontWeight: FontWeight.normal, color: kDarkColor),
    bodyMedium: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: kDarkColor),
    bodySmall: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: kDarkColor),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
        fontSize: 28.0, fontWeight: FontWeight.bold, color: kWhiteColor),
    displayMedium: GoogleFonts.poppins(
        fontSize: 24.0, fontWeight: FontWeight.w700, color: kWhiteColor),
    displaySmall: GoogleFonts.poppins(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: kWhiteColor),
    bodyLarge: GoogleFonts.poppins(
        fontSize: 16.0, fontWeight: FontWeight.normal, color: kWhiteColor),
    bodyMedium: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: kWhiteColor),
    bodySmall: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: kWhiteColor),
  );
}
