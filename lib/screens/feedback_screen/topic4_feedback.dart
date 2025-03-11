import 'package:flutter/material.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:lexchoice/utils/constants/sizes.dart';

class DetailedFeedbackScreenTopic4 extends StatelessWidget {
  const DetailedFeedbackScreenTopic4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Feedback Details",
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
        padding: EdgeInsets.all(LCSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Story Title: Lila’s Choice"),
            _buildText("Completion Status: Completed"),
            _buildText("Time Taken: 5 minutes 30 seconds"),
            _buildText("Total Score: 7/10"),
            const SizedBox(height: LCSizes.md),
            _buildSectionTitle("Performance Breakdown"),
            _buildText("✅ Correct: Online Safety, Cyberbullying Awareness"),
            _buildText(
                "❌ Mistakes: Digital Privacy (Explanation: Be cautious about sharing personal info online)"),
            const SizedBox(height: LCSizes.md),
            _buildSectionTitle("Encouragement & Next Steps"),
            _buildText("🎉 Great job! You're learning a lot!"),
            _buildText("💡 Try learning more about online safety."),
            const SizedBox(height: LCSizes.lg),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: LCColors.buttonPrimary,
                    padding:
                        EdgeInsets.symmetric(vertical: LCSizes.buttonHeight),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(LCSizes.buttonRadius),
                    ),
                  ),
                  child: Text(
                    "Replay Story",
                    style: TextStyle(
                      fontSize: LCSizes.fontSizeMd,
                      fontWeight: FontWeight.bold,
                      color: LCColors.textWhite,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: LCSizes.spaceBtwItems),
      child: Text(
        title,
        style: TextStyle(
          fontSize: LCSizes.fontSizeMd,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: LCSizes.xs),
      child: Text(
        text,
        style: TextStyle(
          fontSize: LCSizes.fontSizeSm,
          fontWeight: FontWeight.w500,
          color: LCColors.textWhite,
        ),
      ),
    );
  }
}
