import 'package:flutter/material.dart';
import 'package:lexchoice/game/game.dart';

class DevinGameScreen extends BaseGameScreen {
  DevinGameScreen({Key? key})
      : super(
          key: key,
          totalGifs: 23, // Adjusted total GIF count for Devin's story
          storyTitle: "Devin's Traffic Trouble",
          assetPrefix: "assets/stories/devin", // Devin's asset path
          choiceSlides: {
            8: {
              "A. Agree with his friend and go through the traffic.": false,
              "B. Realise it's dangerous to do so and stop his friend as well.":
                  true,
              "C. Stop being friends with Kasun.": false,
            },
            16: {
              "A. Waiting on their bicycles in the middle of the traffic.":
                  false,
              "B. Go through the traffic in an unsafe way.": false,
              "C.  Waiting in the side of the road till the traffic clears out and talk to a police officer about road safety.":
                  true,
            }
          },
        );

  @override
  BaseGameScreenState<DevinGameScreen> createState() => _DevinGameScreenState();
}

class _DevinGameScreenState extends BaseGameScreenState<DevinGameScreen> {
  @override
  Widget build(BuildContext context) {
    return super.build(context); // Use the base class's build method
  }
}
