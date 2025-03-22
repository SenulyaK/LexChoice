import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lexchoice/game/widgets/audio_manager.dart';
import 'package:lexchoice/game/widgets/score_manager.dart';
import 'package:lexchoice/utils/theme/custom_themes/glowing_button.dart';
import 'package:lexchoice/game/widgets/timer_manager.dart'; // Import TimerManager

class StarBoard extends StatefulWidget {
  final int finalScore;

  const StarBoard({Key? key, required this.finalScore}) : super(key: key);

  @override
  _StarBoardState createState() => _StarBoardState();
}

class _StarBoardState extends State<StarBoard> with TickerProviderStateMixin {
  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    timerManager.stopTimer(); // Stop timer when reaching this screen
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  final AudioPlayer _audioPlayer = AudioPlayer();

  void _playExitSound() {
    _audioPlayer.play(AssetSource('audio/exit.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    int stars = _calculateStars(widget.finalScore);
    Brightness brightness = Theme.of(context).brightness;

    return Scaffold(
      body: Stack(
        children: [
          // Fullscreen Background GIF with Blur
          Positioned.fill(
            child: Stack(
              children: [
                SizedBox.expand(
                  child: Image.asset(
                    'assets/images/star_back.gif',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                    child: Container(
                      color: Colors.black.withOpacity(0.35),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Foreground UI
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 75),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // "Story Completed" GIF
                  Image.asset(
                    'assets/images/story_completed.gif',
                    width: 400,
                    height: 210,
                    fit: BoxFit.cover,
                  ),

                  const SizedBox(height: 30),

                  // Stars Animation
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      bool isMiddleStar = index == 1;
                      double size = isMiddleStar ? 95 : 70;

                      return Padding(
                        padding: EdgeInsets.only(top: isMiddleStar ? 0 : 30),
                        child: RotationTransition(
                          turns: Tween<double>(begin: -0.05, end: 0.05).animate(
                            CurvedAnimation(
                              parent: _rotationController,
                              curve: Curves.easeInOut,
                            ),
                          ),
                          child: Image.asset(
                            index < stars
                                ? 'assets/images/star_filled.png'
                                : 'assets/images/star_border.png',
                            width: size,
                            height: size,
                          ),
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 20),

                  // Score Label
                  Text(
                    "Your Score: ${widget.finalScore}",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Time Taken Label
                  Text(
                    "Time : ${timerManager.getElapsedTime()}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: brightness == Brightness.dark
                          ? Colors.white70
                          : Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // "OK" Button (Resets Score & Timer)
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: GlowingButton(
                      onPressed: () {
                        _playExitSound();
                        timerManager.resetTimer(); // Reset timer when exiting
                        scoreManager.resetScore(); // Reset score
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Future.delayed(Duration(seconds: 1), () {
                          audioManager.playHomeMusic();
                        });
                      },
                      child: const Icon(
                        Icons.check_rounded,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  int _calculateStars(int score) {
    if (score == 100) return 3;
    if (score >= 60) return 2;
    if (score >= 20) return 1;
    return 0;
  }
}
