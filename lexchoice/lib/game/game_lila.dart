import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lexchoice/game/widgets/HomeConfirmationDialog.dart';
import 'package:lexchoice/utils/theme/custom_themes/glowing_button.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:lexchoice/game/widgets/congratulations_dialog.dart';

class LilaGameScreen extends StatefulWidget {
  @override
  _LilaGameScreenState createState() => _LilaGameScreenState();
}

class _LilaGameScreenState extends State<LilaGameScreen> {
  int _currentGifIndex = 1;
  final int _totalGifs = 22;
  double _opacity = 1.0;
  String? selectedChoice;

  final Map<int, Map<String, bool>> choiceSlides = {
    7: {
      "A. Take the ride, Mr. Silva seems nice.": false,
      "B. Say no and keep walking.": true,
      "C. Ask Mr. Silva to call your parents.": false,
    },
    14: {
      "A. Tell Talya to stay quiet to avoid upsetting her uncle.": false,
      "B. Tell Talya to talk to a teacher or trusted adult.": true,
      "C. Tell Talya to ignore it because adults are always right.": false,
    }
  };

  void _nextGif() {
    if (_currentGifIndex < _totalGifs) {
      setState(() {
        _opacity = 0.0;
      });
      Future.delayed(Duration(milliseconds: 300), () {
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
      setState(() {
        _opacity = 0.0;
      });
      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          _currentGifIndex--;
          _opacity = 1.0;
        });
      });
    }
  }

  void _selectChoice(String choice) {
    bool isCorrect = choiceSlides[_currentGifIndex]![choice]!;
    setState(() {
      selectedChoice = choice;
    });

    if (isCorrect) {
      _nextGif();
    } else {
      _showTryAgainDialog();
    }
  }

  void _showTryAgainDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Incorrect Choice"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/stories/lila/try_again.gif"),
              SizedBox(height: 10),
              Text("That's not the right choice. Try again!"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  selectedChoice = null;
                });
                Navigator.pop(context);
              },
              child: Text("Try Again"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isChoiceSlide = choiceSlides.containsKey(_currentGifIndex);

    return Scaffold(
      body: Stack(
        children: [
          // Back Button to Home Screen (Top Left)
          Positioned(
            top: 36, // Adjust as needed
            left: 5,
            child: IconButton(
              onPressed: () {
                HomeConfirmationDialog.showHomeConfirmationDialog(context);
              }, // Confirmation dialog method
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white, // Icon color
                size: 28, // Icon size
              ),
            ),
          ),

          // Title of the story (Add this at the top inside the Stack)
          Positioned(
            top: 36, // Adjust as needed
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                  // Background with slight transparency
                ),
                child: Text(
                  "Lila's Choice", // Change to your actual title
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          // Gif Image
          AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: _opacity,
            child: IgnorePointer(
              child: Center(
                child: Image.asset(
                  'assets/stories/lila/lila_$_currentGifIndex.gif',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          // Back Button (Always on all pages)
          if (_currentGifIndex > 1)
            Positioned(
              bottom: 20,
              left: 20,
              child: GlowingButton(
                onPressed: _previousGif,
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 28,
                ),
              ),
            ),

          // Next Button (Not on choice slides)
          if (_currentGifIndex < _totalGifs && !isChoiceSlide)
            Positioned(
              bottom: 20,
              right: 20,
              child: GlowingButton(
                onPressed: _nextGif,
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                  size: 28,
                ),
              ),
            ),

          // Finish Button (Only on last slide)
          if (_currentGifIndex == _totalGifs)
            Positioned(
              bottom: 20,
              right: 20,
              child: GlowingButton(
                color1: Colors.red,
                color2: Colors.yellowAccent,
                onPressed: () {
                  CongratulationsDialog.showCongratulationsDialog(context);
                },
                child: const Icon(
                  Icons.flag, // Finish flag icon
                  color: Colors.black,
                  size: 28, // Adjust size as needed
                ),
              ),
            ),

          // Choice Buttons (Only on choice slides)
          if (isChoiceSlide)
            Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              child: Column(
                children: choiceSlides[_currentGifIndex]!.keys.map((choice) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: ClipRRect(
                      // Ensures border radius applies properly
                      borderRadius: BorderRadius.circular(15),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                            sigmaX: 2, sigmaY: 2), // Blur effect
                        child: Container(
                          width: MediaQuery.of(context).size.width *
                              0.87, // 87% width
                          decoration: BoxDecoration(
                            color: LCColors.secondary
                                .withOpacity(0.7), // Semi-transparent white
                            borderRadius:
                                BorderRadius.circular(15), // Rounded corners
                            border: Border.all(
                                color: Colors.greenAccent), // Border color
                          ),
                          child: OutlinedButton(
                            onPressed: () => _selectChoice(choice),
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15), // Adjust height
                              alignment: Alignment.center, // Center text
                              side: BorderSide(
                                  color: Colors
                                      .transparent), // Remove button default border
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    12), // Match border radius
                              ),
                            ),
                            child: Text(
                              choice,
                              textAlign: TextAlign.center,
                              style: TextStyle(
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

          // Progress Bar (Between Back & Next Buttons)
          Positioned(
            bottom: 40, // Adjust position slightly above buttons
            left: MediaQuery.of(context).size.width * 0.30, // Adjust width
            right: MediaQuery.of(context).size.width * 0.30,
            child: Container(
              height: 8, // Thin bar
              decoration: BoxDecoration(
                color: Colors.grey[300], // Background color
                borderRadius: BorderRadius.circular(5),
              ),
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300), // Smooth animation
                    width: (MediaQuery.of(context).size.width * 0.40) *
                        (_currentGifIndex / _totalGifs), // Dynamic width
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: LinearGradient(
                        colors: [
                          Colors.greenAccent,
                          Colors.blue
                        ], // Gradient effect
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
