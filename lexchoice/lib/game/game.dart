import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lexchoice/game/widgets/HomeConfirmationDialog.dart';
import 'package:lexchoice/utils/theme/custom_themes/glowing_button.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:lexchoice/game/widgets/congratulations_dialog.dart';

abstract class BaseGameScreen extends StatefulWidget {
  final int totalGifs;
  final String storyTitle;
  final String assetPrefix;
  final Map<int, Map<String, bool>> choiceSlides;

  const BaseGameScreen({
    required this.totalGifs,
    required this.storyTitle,
    required this.assetPrefix,
    required this.choiceSlides,
    Key? key,
  }) : super(key: key);
}

abstract class BaseGameScreenState<T extends BaseGameScreen> extends State<T> {
  int _currentGifIndex = 1;
  double _opacity = 1.0;
  String? selectedChoice;

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
      CongratulationsDialog.showCongratulationsDialog(context);
    }
  }

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

  void _selectChoice(String choice) {
    bool isCorrect = widget.choiceSlides[_currentGifIndex]![choice]!;
    setState(() => selectedChoice = choice);
    isCorrect ? _nextGif() : _showTryAgainDialog();
  }

  void _showTryAgainDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Incorrect Choice"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("${widget.assetPrefix}/try_again.gif"),
              const SizedBox(height: 10),
              const Text("That's not the right choice. Try again!"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() => selectedChoice = null);
                Navigator.pop(context);
              },
              child: const Text("Try Again"),
            ),
          ],
        );
      },
    );
  }

  void _resetGame() {
    setState(() {
      _currentGifIndex = 1;
      selectedChoice = null;
      _opacity = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isChoiceSlide = widget.choiceSlides.containsKey(_currentGifIndex);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 36,
            left: 5,
            child: IconButton(
              onPressed: () => HomeConfirmationDialog.showHomeConfirmationDialog(context),
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
            ),
          ),
          Positioned(
            top: 36,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  widget.storyTitle,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _opacity,
            child: IgnorePointer(
              child: Center(
                child: Image.asset(
                  '${widget.assetPrefix}/${widget.assetPrefix.split('/').last}_$_currentGifIndex.gif',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          if (_currentGifIndex > 1)
            Positioned(
              bottom: 20,
              left: 20,
              child: GlowingButton(
                onPressed: _previousGif,
                child: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
              ),
            ),
          if (_currentGifIndex < widget.totalGifs && !isChoiceSlide)
            Positioned(
              bottom: 20,
              right: 20,
              child: GlowingButton(
                onPressed: _nextGif,
                child: const Icon(Icons.arrow_forward, color: Colors.black, size: 28),
              ),
            ),
          if (_currentGifIndex == widget.totalGifs)
            Positioned(
              bottom: 20,
              right: 20,
              child: GlowingButton(
                color1: Colors.red,
                color2: Colors.yellowAccent,
                onPressed: () => CongratulationsDialog.showCongratulationsDialog(context),
                child: const Icon(Icons.flag, color: Colors.black, size: 28),
              ),
            ),
          if (isChoiceSlide)
            Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              child: Column(
                children: widget.choiceSlides[_currentGifIndex]!.keys.map((choice) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
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
                            onPressed: () => _selectChoice(choice),
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
                                fontSize: 17,
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
            bottom: 40,
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
                    width: (MediaQuery.of(context).size.width * 0.40) * (_currentGifIndex / widget.totalGifs),
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
