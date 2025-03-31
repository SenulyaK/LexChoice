import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lexchoice/game/widgets/audio_manager.dart';
import 'package:lexchoice/game/widgets/score_manager.dart';
import 'package:lexchoice/utils/constants/colors.dart';

class HomeConfirmationDialog {
  static void showHomeConfirmationDialog(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final AudioPlayer _audioPlayer = AudioPlayer();

    void _playTapSound() {
      _audioPlayer.play(AssetSource('audio/tap.mp3'));
    }

    void _playExitSound() {
      _audioPlayer.play(AssetSource('audio/exit.mp3'));
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor:
            isDarkMode ? LCColors.secondary : Colors.white, // Adjust for theme
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          "Go Back?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? LCColors.white : Colors.red, // Adjust for theme
          ),
        ),
        content: Text(
          "Are you sure you want to go back to the previous screen?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: isDarkMode ? Colors.white : Colors.black, // Adjust for theme
          ),
        ),

        actionsAlignment: MainAxisAlignment.spaceAround,

        actions: [
          ElevatedButton(
            onPressed: () {
              _playTapSound();
              Navigator.of(context).pop();
            }, // Close the dialog
            style: ElevatedButton.styleFrom(
              backgroundColor: LCColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              side: BorderSide.none,
            ),
            child: Text(
              "Cancel",
              style: TextStyle(
                  color: isDarkMode
                      ? Colors.white
                      : Colors.white), // Adjust for theme
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _playExitSound();
              Navigator.of(context).pop(); // Close the dialog
              Navigator.of(context).pop();
              scoreManager.resetScore();
              audioManager.stopBackgroundMusic();
              Future.delayed(Duration(seconds: 1), () {
                      audioManager.playHomeMusic();
                    }); // Go back to the previous screen
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              side: BorderSide.none,
            ),
            child: Text(
              "Go Back",
              style: TextStyle(
                  color: isDarkMode
                      ? Colors.white
                      : Colors.white), // Adjust for theme
            ),
          ),
        ],
      ),
    );
  }
}
