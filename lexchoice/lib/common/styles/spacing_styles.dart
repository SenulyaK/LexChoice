import 'package:flutter/material.dart';
import 'package:lexchoice/utils/constants/sizes.dart';

class LCSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: LCSizes.appBarHeight,
    left: LCSizes.defaultSpace,
    right: LCSizes.defaultSpace,
    bottom: LCSizes.defaultSpace,
  );
}