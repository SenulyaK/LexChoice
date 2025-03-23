import 'package:flutter/material.dart';
import 'package:lexchoice/screens/feedback_screen/topic2_feedback.dart';
import 'package:lexchoice/screens/feedback_screen/topic3_feedback.dart';
import 'package:lexchoice/screens/feedback_screen/topic4_feedback.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:lexchoice/utils/constants/sizes.dart';
import 'package:lexchoice/screens/feedback_screen/topic1_feedback.dart';
import 'package:lexchoice/screens/feedback_screen/topic5_feedback.dart';

// This is the main widget for the Feedback Selection Screen.
// It allows users to select a topic to provide feedback on.
class FeedbackSelectionScreen extends StatelessWidget {
  const FeedbackSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with a title "Feedback"
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0), // Adjust the height as needed
        child: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Feedback',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 70.0, // Larger font size
            ),
          ),
          backgroundColor: Colors.transparent,
          toolbarHeight: 120,
          elevation: 0,
          centerTitle: false, // Align title to the left
          titleSpacing:
              20.0, // Optional, to add some space between the title and the left edge
        ),
      ),
      // Body of the screen with a gradient background
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              // Gradient colors change based on the theme (light/dark mode)
              Theme.of(context).brightness == Brightness.dark
                  ? LCColors.secondary
                  : Colors.white,
              Theme.of(context).brightness == Brightness.dark
                  ? LCColors.background
                  : LCColors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding:
            const EdgeInsets.all(LCSizes.md), // Padding around the container
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20), // Horizontal padding
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center the column vertically
              crossAxisAlignment:
                  CrossAxisAlignment.stretch, // Stretch children horizontally
              children: [
                // Buttons for each feedback topic
                _buildFeedbackButton(context, "Lila’s Choice",
                    const DetailedFeedbackScreenTopic1()),
                _buildFeedbackButton(context, "Aarya’s Decision",
                    const DetailedFeedbackScreenTopic2()),
                _buildFeedbackButton(context, "Ravi’s Future",
                    const DetailedFeedbackScreenTopic3()),
                _buildFeedbackButton(context, "Devin’s Traffic Trouble",
                    const DetailedFeedbackScreenTopic4()),
                _buildFeedbackButton(context, "Amy’s Cyber Rules",
                    const DetailedFeedbackScreenTopic5()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build a feedback button
  Widget _buildFeedbackButton(
      BuildContext context, String title, Widget? screen) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: LCSizes.sm), // Vertical padding
      child: SizedBox(
        width: double.infinity, // Make the button take the full width
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: LCColors.primary, // Button background color
            padding: const EdgeInsets.symmetric(vertical: 16), // Button padding
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  LCSizes.borderRadiusMd), // Rounded corners
            ),
          ),
          onPressed: () {
            // Navigate to the corresponding feedback screen when pressed
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
              color: Colors.white, // Text color
            ),
          ),
        ),
      ),
    );
  }
}
