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
              "A. Go back to his mother and tell her about it.": true,
              "B. Going around the market to find it by himself.": false,
              "C. Ignoring the situation.": false,
            },
            24: {
              "A. Ignore that information.": false,
              "B. Telling the officer all the infomation he can remember about that person.":
                  true,
              "C. Trying to find that person by himself without telling the officer.":
                  false,
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
