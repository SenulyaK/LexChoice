import 'package:flutter/material.dart';
import 'package:lexchoice/game/game.dart';

class DevinGameScreen extends BaseGameScreen {
  DevinGameScreen({Key? key})
      : super(
          key: key,
          totalGifs: 24, // Adjusted total GIF count for Devin's story
          storyTitle: "Devin's Traffic Trouble",
          assetPrefix: "assets/stories/devin", // Devin's asset path
          choiceSlides: {
            8: {
              "A. Cross the road without looking.": false,
              "B. Wait for the signal before crossing.": true,
              "C. Run across quickly to save time.": false,
            },
            16: {
              "A. Ride a bike without a helmet.": false,
              "B. Always wear a helmet while cycling.": true,
              "C. Ride on the wrong side of the road.": false,
            },
            24: {
              "A. Ignore traffic signs if no one is around.": false,
              "B. Follow traffic signs and signals.": true,
              "C. Cross wherever you feel like.": false,
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
