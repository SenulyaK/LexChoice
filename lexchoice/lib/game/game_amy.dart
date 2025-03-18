import 'package:flutter/material.dart';
import 'package:lexchoice/game/game.dart';

class AmyGameScreen extends BaseGameScreen {
  AmyGameScreen({Key? key})
      : super(
          key: key,
          totalGifs: 40, // Adjusted total GIF count for Amy's story
          storyTitle: "Amy's Cyber Rules",
          assetPrefix: "assets/stories/amy", // Amy's asset path
          choiceSlides: {
            4: {
              "A. Ignore and continue playing.": false,
              "B. Tell someone you know about the issue and get help.": true,
              "C. Log out and stop playing.": false,
            },
            25: {
              "A. Ignore and hope the hacker gives the coins back.": false,
              "B. Search for other ways to get the coins.": false,
              "C. Contact a professional and report the incident.": true,
            },
            30: {
              "A. Send an Email to them.": false,
              "B. Call them through their hotline 101 .": true,
              "C. Send a physical letter to them.": false,
            },
            38: {
              "A. Take cyber safety measures to ensure safety online.": true,
              "B. Ignoring everything happened and continue to play.": false,
              "C. Give up playing online games.": false,
            }
          },
        );

  @override
  BaseGameScreenState<AmyGameScreen> createState() => _AmyGameScreenState();
}

class _AmyGameScreenState extends BaseGameScreenState<AmyGameScreen> {
  @override
  Widget build(BuildContext context) {
    return super.build(context); // Use the base class's build method
  }
}
