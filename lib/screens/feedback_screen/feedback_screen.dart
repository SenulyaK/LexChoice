import 'package:flutter/material.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:lexchoice/utils/constants/sizes.dart';

class FeedbackSelectionScreen extends StatelessWidget {
  const FeedbackSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> stories = [
      "Lila’s Choice",
      "Aarya’s Decision",
      "Ravi’s Future",
      "Dillion’s Traffic Trouble",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Feedback",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: LCColors.appBarColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(LCSizes.md),
        color: LCColors.background,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20), // Prevents edge-to-edge buttons
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:
                  CrossAxisAlignment.stretch, // Expands buttons horizontally
              children: stories.map((story) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: LCSizes.sm),
                  child: SizedBox(
                    width:
                        double.infinity, // Makes the button expand horizontally
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: LCColors.primary,
                        padding: const EdgeInsets.symmetric(
                            vertical: 16), // Adjust button height
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(LCSizes.borderRadiusMd),
                        ),
                      ),
                      onPressed: () {
                        // Navigate to the detailed feedback screen
                      },
                      child: Text(
                        story,
                        style: const TextStyle(
                          fontSize: LCSizes.fontSizeMd,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
