import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LCTextTheme {
  LCTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.poppins(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
    headlineMedium: GoogleFonts.poppins(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.black),
    headlineSmall: GoogleFonts.poppins(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
    titleLarge: GoogleFonts.poppins(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
    titleMedium: GoogleFonts.poppins(
        fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black),
    titleSmall: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.black),
    bodyLarge: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black),
    bodyMedium: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black),
    bodySmall: GoogleFonts.poppins(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: Colors.black.withOpacity(0.5)),
    labelLarge: GoogleFonts.poppins(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black),
    labelMedium: GoogleFonts.poppins(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: Colors.black.withOpacity(0.5)),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.poppins(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
    headlineMedium: GoogleFonts.poppins(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.white),
    headlineSmall: GoogleFonts.poppins(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
    titleLarge: GoogleFonts.poppins(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
    titleMedium: GoogleFonts.poppins(
        fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white),
    titleSmall: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.w300, color: Colors.white),
    bodyLarge: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.w200, color: Colors.white),
    bodyMedium: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.w200, color: Colors.white),
    bodySmall: GoogleFonts.poppins(
        fontSize: 14.0,
        fontWeight: FontWeight.w100,
        color: Colors.white.withOpacity(0.5)),
    labelLarge: GoogleFonts.poppins(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.white),
    labelMedium: GoogleFonts.poppins(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: Colors.white.withOpacity(0.5)),
  );
}
