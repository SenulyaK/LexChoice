import 'package:flutter/material.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:lexchoice/utils/theme/custom_themes/text_theme.dart';

import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_field_theme.dart';

class LCAppTheme {
  LCAppTheme._();

  /// Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: LCTextTheme.lightTextTheme,
    chipTheme: LCChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: LCAppBarTheme.lightAppBarTheme,
    checkboxTheme: LCCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: LCBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: LCElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: LCOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: LCTextFormFieldTheme.lightInputDecorationTheme,
  );

  /// Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: LCColors.primary,
    textTheme: LCTextTheme.darkTextTheme,
    chipTheme: LCChipTheme.darkChipTheme,
    scaffoldBackgroundColor: LCColors.secondary,
    appBarTheme: LCAppBarTheme.darkAppBarTheme,
    checkboxTheme: LCCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: LCBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: LCElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: LCOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: LCTextFormFieldTheme.darkInputDecorationTheme,
  );
}
