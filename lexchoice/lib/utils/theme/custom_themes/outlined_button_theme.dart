import 'package:flutter/material.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart'; // Add this import

class LCOutlinedButtonTheme {
  LCOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: LCColors.primary,
      side: const BorderSide(color: LCColors.primary),
      textStyle: GoogleFonts.poppins(
        fontSize: 16, 
        color: LCColors.primary, 
        fontWeight: FontWeight.w600
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      padding: const EdgeInsets.symmetric(vertical: 18),
    ),
  );

  // Dark Mode
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: LCColors.primary,
      side: const BorderSide(color: LCColors.primary),
      textStyle: GoogleFonts.poppins(
        fontSize: 16, 
        color: LCColors.primary, 
        fontWeight: FontWeight.w600
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      padding: const EdgeInsets.symmetric(vertical: 18),
    ),
  );
}
