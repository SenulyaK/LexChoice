import 'package:flutter/material.dart';
import 'package:lexchoice/game/game.dart';

class LilaGameScreen extends BaseGameScreen {
  LilaGameScreen({Key? key})
      : super(
          key: key,
          totalGifs: 22, // Adjusted total GIF count for Lila's story
          storyTitle: "Lila's Journey",
          assetPrefix: "assets/stories/lila", // Lila's asset path
          choiceSlides: {
            7: {
              "A. Take the ride, Mr. Silva seems nice.": false,
              "B. Say no and keep walking.": true,
              "C. Ask Mr. Silva to call your parents.": false,
            },
            14: {
              "A. Tell Talya to stay quiet to avoid upsetting her uncle.":
                  false,
              "B. Tell Talya to talk to a teacher or trusted adult.": true,
              "C. Tell Talya to ignore it because adults are always right.":
                  false,
            }
          },
        );

  @override
  BaseGameScreenState<LilaGameScreen> createState() => _LilaGameScreenState();
}

class _LilaGameScreenState extends BaseGameScreenState<LilaGameScreen> {
  @override
  Widget build(BuildContext context) {
    return super.build(context); // Use the base class's build method
  }
}
