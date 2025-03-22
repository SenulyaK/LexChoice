import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lexchoice/game/widgets/HomeConfirmationDialog.dart';
import 'package:lexchoice/game/widgets/audio_manager.dart';
import 'package:lexchoice/utils/theme/custom_themes/glowing_button.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:lexchoice/game/widgets/congratulations_dialog.dart';
import 'package:lexchoice/game/widgets/tryagain_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:lexchoice/game/widgets/animated_background.dart';
import 'package:lexchoice/game/widgets/score_manager.dart';

// Abstract base class for game screens
abstract class BaseGameScreen extends StatefulWidget {
  final int totalGifs; // Total number of GIFs in the story
  final String storyTitle; // Title of the story
  final String assetPrefix; // Path prefix for assets
  final Map<int, Map<String, bool>>
      choiceSlides; // Map of choices for interactive slides

  const BaseGameScreen({
    required this.totalGifs,
    required this.storyTitle,
    required this.assetPrefix,
    required this.choiceSlides,
    Key? key,
  }) : super(key: key);
}

// Abstract state class to manage game logic
abstract class BaseGameScreenState<T extends BaseGameScreen> extends State<T> {
  int _currentGifIndex = 1; // Current GIF index
  double _opacity = 1.0; // Opacity for GIF transitions
  String? selectedChoice; // Stores the selected choice

  // Advances to the next GIF or shows the congratulations dialog
  void _nextGif() {
    if (_currentGifIndex < widget.totalGifs) {
      setState(() => _opacity = 0.0);
      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          _currentGifIndex++;
          _opacity = 1.0;
          selectedChoice = null;
        });
      });
    } else {
      bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
      CongratulationsDialog.showCongratulationsDialog(
          context, widget.assetPrefix, isDarkMode);
    }
  }

  // Moves back to the previous GIF
  void _previousGif() {
    if (_currentGifIndex > 1) {
      setState(() => _opacity = 0.0);
      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          _currentGifIndex--;
          _opacity = 1.0;
        });
      });
    }
  }

  // Try Again Screen
  void _selectChoice(String choice) {
    bool isCorrect = widget.choiceSlides[_currentGifIndex]![choice]!;
    setState(() => selectedChoice = choice);

    if (isCorrect) {
      _playSound("audio/correct.mp3");
      HapticFeedback.heavyImpact; // Play correct answer sound
      _nextGif();
      Future.delayed(Duration(seconds: 1), () {
        audioManager.resumeBackgroundMusic();
      }); // Proceed to next slide
    } else {
      _playSound("audio/wrong.mp3");
      scoreManager.deductPoints();
      audioManager.pauseBackgroundMusic(); // Play wrong answer sound

      bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
      TryAgainDialog.showTryAgainDialog(context, widget.assetPrefix, () {
        setState(() => selectedChoice = null);
      }, isDarkMode);
    }
  }

  /// Click Sound
  final AudioPlayer _audioPlayer = AudioPlayer();

  void _playClickSound() {
    _audioPlayer.play(AssetSource('audio/click.mp3'));
  }

  void _playCongratsSound() async {
    await _audioPlayer.play(AssetSource('audio/congrats.mp3'));
  }

  void _playSound(String soundPath) {
    _audioPlayer.play(AssetSource(soundPath));
  }

  @override
  Widget build(BuildContext context) {
    bool isChoiceSlide = widget.choiceSlides.containsKey(_currentGifIndex);
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          BackgroundAnimation(), // Add the animated background here

          // Back button
          Positioned(
            top: 36,
            left: 1,
            child: IconButton(
              onPressed: () =>
                  HomeConfirmationDialog.showHomeConfirmationDialog(context),
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: isDarkMode ? Colors.white : Colors.black,
                size: 20,
              ),
            ),
          ),

          // Story title
          Positioned(
            top: 36,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  widget.storyTitle,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),

          // Animated GIF display
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _opacity,
            child: IgnorePointer(
              child: Center(
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(20), // Add your desired radius here
                  child: Image.asset(
                    '${widget.assetPrefix}/${widget.assetPrefix.split('/').last}_$_currentGifIndex.gif',
                    width: 365,
                    height: 670,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          // Previous button
          if (_currentGifIndex > 1)
            Positioned(
              bottom: 26,
              left: 20,
              child: GlowingButton(
                color1: Colors.lightGreenAccent,
                color2: Colors.greenAccent,
                onPressed: () {
                  HapticFeedback.heavyImpact();
                  _playClickSound(); // Play the click sound
                  _previousGif();
                  Future.delayed(Duration(seconds: 1), () {
                    audioManager.resumeBackgroundMusic();
                  });
                },
                child: const Icon(Icons.arrow_back_rounded,
                    color: Colors.black, size: 28),
              ),
            ),

          // Next button
          if (_currentGifIndex < widget.totalGifs && !isChoiceSlide)
            Positioned(
              bottom: 26,
              right: 20,
              child: GlowingButton(
                color1: Colors.lightBlueAccent,
                color2: Colors.cyan,
                onPressed: () {
                  HapticFeedback.heavyImpact();
                  _playClickSound(); // Play the click sound
                  _nextGif();
                  Future.delayed(Duration(seconds: 1), () {
                    audioManager.resumeBackgroundMusic();
                  });
                },
                child: const Icon(Icons.arrow_forward_rounded,
                    color: Colors.black, size: 28),
              ),
            ),

          // Congratulations button on the final slide
          if (_currentGifIndex == widget.totalGifs)
            Positioned(
              bottom: 26,
              right: 20,
              child: GlowingButton(
                color1: Colors.red,
                color2: Colors.yellowAccent,
                onPressed: () {
                  HapticFeedback.heavyImpact();
                  _playCongratsSound(); // Play the congrats sound;
                  CongratulationsDialog.showCongratulationsDialog(
                      context, widget.assetPrefix, isDarkMode);
                },
                child: const Icon(Icons.flag, color: Colors.black, size: 28),
              ),
            ),

          // Choice buttons
          if (isChoiceSlide)
            Positioned(
              bottom: 110,
              left: 0,
              right: 0,
              child: Column(
                children:
                    widget.choiceSlides[_currentGifIndex]!.keys.map((choice) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.87,
                          decoration: BoxDecoration(
                            color: LCColors.secondary.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.greenAccent),
                          ),
                          child: OutlinedButton(
                            onPressed: () {
                              _selectChoice(
                                  choice); // Then execute the choice selection
                            },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              alignment: Alignment.center,
                              side: const BorderSide(color: Colors.transparent),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              choice,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.greenAccent,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

          // Progress Bar
          Positioned(
            bottom: 46,
            left: MediaQuery.of(context).size.width * 0.30,
            right: MediaQuery.of(context).size.width * 0.30,
            child: Container(
              height: 8,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: (MediaQuery.of(context).size.width * 0.40) *
                        (_currentGifIndex / widget.totalGifs),
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: const LinearGradient(
                        colors: [Colors.greenAccent, Colors.blue],
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
}
