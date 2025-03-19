import 'package:flutter/material.dart';
import 'package:lexchoice/utils/theme/custom_themes/glowing_button.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:lexchoice/game/widgets/star_board.dart';
import 'package:lexchoice/game/widgets/score_manager.dart';

class CongratulationsDialog {
  static void showCongratulationsDialog(
      BuildContext context, String assetPrefix, bool isDarkMode) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: isDarkMode ? LCColors.secondary : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Center(
            child: Text(
              "WELL DONE!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
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
              child: SizedBox(
                width: 130,
                child: GlowingButton(
                  onPressed: () async {
                    final player = AudioPlayer();
                    await player
                        .play(AssetSource('audio/ok.mp3')); // Play sound

                    Navigator.pop(context); // Close current dialog

                    // Navigate to StarBoard screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            StarBoard(finalScore: scoreManager.getScore()),
                      ),
                    );
                  },
                  child: const Text(
                    "Got it!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
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
