import 'dart:ui';
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
      barrierColor: Colors.black.withOpacity(0.4), // Dim background
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent, // Fully transparent dialog
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white
                      .withOpacity(0.3), // Adjust opacity for effect
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Well Done!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: LCColors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Thing you should remember:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      "$assetPrefix/congrats.gif",
                      height: 450,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 130,
                      child: GlowingButton(
                        onPressed: () async {
                          final player = AudioPlayer();
                          await player.play(AssetSource('audio/ok.mp3'));

                          Navigator.pop(context); // Close dialog

                          // Navigate to StarBoard screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StarBoard(
                                  finalScore: scoreManager.getScore()),
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
