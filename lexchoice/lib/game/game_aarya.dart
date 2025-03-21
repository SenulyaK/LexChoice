import 'package:flutter/material.dart';
import 'package:lexchoice/game/game.dart';

class AaryaGameScreen extends BaseGameScreen {
  AaryaGameScreen({Key? key})
      : super(
          key: key,
          totalGifs: 42, 
          storyTitle: "Aarya's Decisions",
          assetPrefix: "assets/stories/aarya", // Aarya's asset path
          choiceSlides: {
            10: {
              "A. Try to solve the problem alone.": false,
              "B. Ask a trusted friend for help.": true,
              "C. Ignore the issue and hope it goes away.": false,
            },
            24: {
              "A. Take a shortcut through an unfamiliar path.": false,
              "B. Follow the main road, even if it takes longer.": true,
              "C. Stay in one place and wait for someone to find you.": false,
            }
          },
        );

  @override
  BaseGameScreenState<AaryaGameScreen> createState() => _AaryaGameScreenState();
}

class _AaryaGameScreenState extends BaseGameScreenState<AaryaGameScreen> {
  @override
  Widget build(BuildContext context) {
    return super.build(context); // Use the base class's build method
  }
}
