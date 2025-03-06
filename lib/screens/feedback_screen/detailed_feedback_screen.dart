import 'package:flutter/material.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:lexchoice/utils/constants/sizes.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Feedback",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: LCColors.primary,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(LCSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Summary Section
            Text(
              "You completed 'Cyberbullying Awareness'!",
              style: TextStyle(
                fontSize: LCSizes.fontSizeMd,
                fontWeight: FontWeight.w700,
                color: LCColors.textPrimary,
              ),
            ),
            const SizedBox(height: 10),
            Text("⏳ Time Taken: 5 minutes 30 seconds"),
            Text("🎯 Total Score: 7/10"),

            const SizedBox(height: 20),

            // Performance Breakdown
            Text(
              "Performance Breakdown",
              style: TextStyle(
                fontSize: LCSizes.fontSizeMd,
                fontWeight: FontWeight.w700,
                color: LCColors.textPrimary,
              ),
            ),
            const SizedBox(height: 10),
            _buildPerformanceItem("✅ Cyber Safety Basics", true),
            _buildPerformanceItem("❌ Social Media Privacy", false),
            _buildPerformanceItem("✅ Identifying Cyberbullying", true),

            const SizedBox(height: 20),

            // Encouragement & Next Steps
            Text(
              "Great job! You're learning so much!",
              style: TextStyle(
                fontSize: LCSizes.fontSizeMd,
                fontWeight: FontWeight.w600,
                color: LCColors.primary,
              ),
            ),
            const SizedBox(height: 10),
            Text("🔍 Try learning more about online safety."),

            const Spacer(),

            // Replay & Exit Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: LCColors.buttonPrimary,
                    padding: EdgeInsets.symmetric(
                        horizontal: LCSizes.buttonHeight, vertical: LCSizes.sm),
                  ),
                  child: const Text("🔄 Replay Story"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: LCColors.primary,
                    padding: EdgeInsets.symmetric(
                        horizontal: LCSizes.buttonHeight, vertical: LCSizes.sm),
                  ),
                  child: const Text("🏠 Back to Menu"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceItem(String text, bool correct) {
    return ListTile(
      leading: Icon(
        correct ? Icons.check_circle : Icons.cancel,
        color: correct ? Colors.green : Colors.red,
      ),
      title: Text(text),
    );
  }
}
