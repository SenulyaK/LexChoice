import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lexchoice/game/widgets/audio_manager.dart';
import 'package:lexchoice/utils/theme/custom_themes/glowing_button.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:lexchoice/game/widgets/star_board.dart';
import 'package:lexchoice/game/widgets/score_manager.dart';
import 'dart:convert'; // For JSON encoding
import 'package:http/http.dart' as http; // For HTTP requests

class CongratulationsDialog {
  static void showCongratulationsDialog(
      BuildContext context, String assetPrefix, bool isDarkMode, int gameID) {
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
              filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: LCColors.secondary
                      .withOpacity(0.3), // Adjust opacity for effect
                  borderRadius: BorderRadius.circular(20),
                  border:
                      Border.all(color: Colors.transparent.withOpacity(0.2)),
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
                        color: LCColors.primary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Thing you should remember:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
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
                          audioManager.stopBackgroundMusic();

                          final score = scoreManager.getScore();
                          await sendScoreToBackend(score, gameID);

                          Navigator.pop(context); // Close dialog

                          // Navigate to StarBoard screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  StarBoard(finalScore: score),
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

  static Future<void> sendScoreToBackend(int score, int gameID) async {
    final userId = 1;

    final url = Uri.parse('http://localhost:8080/api/v1/score/save-score');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'userId': userId,
        'gameId': gameID,
        'score': score,
        'time': DateTime.now()
            .toIso8601String(), // Set the current time for submission
      }),
    );

    if (response.statusCode == 201) {
      print('Score saved successfully');
    } else {
      print('Failed to save score: ${response.body}');
    }
  }
}
