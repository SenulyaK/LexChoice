import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lexchoice/utils/theme/custom_themes/glowing_button.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:audioplayers/audioplayers.dart';

class TryAgainDialog {
  static void showTryAgainDialog(BuildContext context, String assetPrefix,
      VoidCallback onTryAgain, bool isDarkMode) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4), // Dim background
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent, // Make dialog fully transparent
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
                    TweenAnimationBuilder<double>(
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
                    const SizedBox(height: 10),
                    Text(
                      "Keep going! You can do it!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Image.asset(
                      "$assetPrefix/try_again.gif",
                      height: 400,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 160,
                      child: GlowingButton(
                        onPressed: () async {
                          final player = AudioPlayer();
                          await player.play(AssetSource('audio/tryagain.mp3'));
                          Navigator.pop(context);
                          onTryAgain();
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
