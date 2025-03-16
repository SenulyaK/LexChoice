import 'package:flutter/material.dart';
import 'package:lexchoice/utils/theme/custom_themes/glowing_button.dart';
import 'package:lexchoice/utils/constants/colors.dart';

class CongratulationsDialog {
  static void showCongratulationsDialog(
      BuildContext context, String assetPrefix, bool isDarkMode) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: isDarkMode
              ? LCColors.secondary
              : Colors.white, // Dark mode support
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Center(
            child: const Text(
              "WELL DONE!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32, // Bigger modern font
                fontWeight: FontWeight.bold,
                color: LCColors.primary,
              ),
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Thing you should remember:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Image.asset(
                  "$assetPrefix/congrats.gif",
                  height: 450,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
          actions: [
            Center(
              child: GlowingButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Text(
                  "OK",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
