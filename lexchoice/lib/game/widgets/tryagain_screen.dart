import 'package:flutter/material.dart';
import 'package:lexchoice/utils/theme/custom_themes/glowing_button.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:audioplayers/audioplayers.dart';

class TryAgainDialog {
  static void showTryAgainDialog(BuildContext context, String assetPrefix,
      VoidCallback onTryAgain, bool isDarkMode) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: isDarkMode ? LCColors.secondary : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Center(
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 600),
              curve: Curves.bounceOut,
              tween: Tween(begin: 0.0, end: 1.0),
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.scale(
                    scale: 0.8 + (0.2 * value),
                    child: child,
                  ),
                );
              },
              child: const Text(
                "TRY AGAIN!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: LCColors.error,
                ),
              ),
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Keep going! You can do it!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  "$assetPrefix/try_again.gif",
                  height: 400,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
          actions: [
            Center(
              child: SizedBox(
                width: 160,
                child: GlowingButton(
                  onPressed: () async {
                    final player = AudioPlayer();
                    await player
                        .play(AssetSource('audio/tryagain.mp3')); // Play sound
                    Navigator.pop(context); // Close the dialog
                    onTryAgain(); // Reset selected choice
                  },
                  color1: Colors.orange,
                  color2: Colors.redAccent,
                  child: const Text(
                    "TRY AGAIN",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
