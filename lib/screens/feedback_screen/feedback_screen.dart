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
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              // Check if the current theme is dark or light
              Theme.of(context).brightness == Brightness.dark
                  ? LCColors.secondary // Dark mode colors
                  : Colors.white, // Light mode colors
              Theme.of(context).brightness == Brightness.dark
                  ? LCColors.background // Dark mode colors
                  : LCColors.darkGrey, // Light mode colors
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(LCSizes.md),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: stories.map((story) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: LCSizes.sm),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: LCColors.primary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
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
