import 'package:flutter/material.dart';
import 'package:lexchoice/game/game.dart';

class RaviGameScreen extends BaseGameScreen {
  RaviGameScreen({Key? key})
      : super(
          key: key,
          totalGifs: 37, // Adjusted total GIF count for Ravi's story
          storyTitle: "Ravi's Future",
          assetPrefix: "assets/stories/ravi", // Ravi's asset path
          choiceSlides: {
            19: {
              "A. Tell his mother he wants to stay in school and look for other solutions.": true,
              "B. Accept the job because his family needs money.": false,
              "C. Stay silent and hope the problem goes away": false,
            },
            33: {
              "A. To stop children from helping their families.": false,
              "B. To protect children’s health, education, and future.": true,
              "C. Because adults don’t want children to work.": false,
            }
          },
        );

  @override
  BaseGameScreenState<RaviGameScreen> createState() => _RaviGameScreenState();
}

class _RaviGameScreenState extends BaseGameScreenState<RaviGameScreen> {
  @override
  Widget build(BuildContext context) {
    return super.build(context); // Use the base class's build method
  }
}
