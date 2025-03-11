import 'package:flutter/material.dart';
import 'package:lexchoice/screens/feedback_screen/topic2_feedback.dart';
import 'package:lexchoice/screens/feedback_screen/topic3_feedback.dart';
import 'package:lexchoice/screens/feedback_screen/topic4_feedback.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:lexchoice/utils/constants/sizes.dart';
import 'package:lexchoice/screens/feedback_screen/topic1_feedback.dart';

class FeedbackSelectionScreen extends StatelessWidget {
  const FeedbackSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              Theme.of(context).brightness == Brightness.dark
                  ? LCColors.secondary
                  : Colors.white,
              Theme.of(context).brightness == Brightness.dark
                  ? LCColors.background
                  : LCColors.darkGrey,
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
              children: [
                _buildFeedbackButton(context, "Lila’s Choice",
                    const DetailedFeedbackScreenTopic1()),
                _buildFeedbackButton(context, "Aarya’s Decision",
                    const DetailedFeedbackScreenTopic2()),
                _buildFeedbackButton(context, "Ravi’s Future",
                    const DetailedFeedbackScreenTopic3()),
                _buildFeedbackButton(context, "Dillon’s Traffic Trouble",
                    const DetailedFeedbackScreenTopic4()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeedbackButton(
      BuildContext context, String title, Widget? screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: LCSizes.sm),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: LCColors.primary,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(LCSizes.borderRadiusMd),
            ),
          ),
          onPressed: () {
            if (screen != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => screen),
              );
            }
          },
          child: Text(
            title,
            style: const TextStyle(
              fontSize: LCSizes.fontSizeMd,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
