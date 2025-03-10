import 'package:flutter/material.dart';
import 'package:lexchoice/game/game.dart';

class RaviGameScreen extends BaseGameScreen {
  RaviGameScreen({Key? key})
      : super(
          key: key,
          totalGifs: 37, // Adjusted total GIF count for Ravi's story
          storyTitle: "Ravi's Adventure",
          assetPrefix: "assets/stories/ravi", // Ravi's asset path
          choiceSlides: {
            19: {
              "A. Trust the stranger and follow him.": false,
              "B. Politely refuse and find a safe place.": true,
              "C. Call a friend and tell them first.": false,
            },
            33: {
              "A. Ignore the warning and keep the secret.": false,
              "B. Talk to a trusted adult for guidance.": true,
              "C. Keep quiet because you don't want trouble.": false,
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
