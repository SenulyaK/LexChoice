import 'package:flutter/material.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:lexchoice/utils/constants/sizes.dart';

import 'package:google_fonts/google_fonts.dart';

// This is the detailed feedback screen for Topic 1.
// It displays the user's performance, score, and learning outcomes in a kid-friendly way.
class DetailedFeedbackScreenTopic4 extends StatelessWidget {
  const DetailedFeedbackScreenTopic4({super.key});

  @override
  Widget build(BuildContext context) {
    // Check if the app is in dark mode
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    // Define the text color based on the app's theme
    final textColor = LCColors.textWhite;

    return Scaffold(
      // Extend the body behind the app bar
      extendBodyBehindAppBar: true,
      // AppBar with a celebratory title and a back button
      appBar: AppBar(
        title: const Text(
          "",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 120, // Transparent background
        elevation: 0, // No shadow
        centerTitle: true, // Center the title
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: LCColors.textWhite),
          onPressed: () => Navigator.pop(context), // Navigate back on press
        ),
      ),
      // Body of the screen with a gradient background
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isDarkMode
                  ? [
                      LCColors.secondary,
                      LCColors.background
                    ] // Dark mode gradient
                  : [LCColors.white, LCColors.darkGrey], // Light mode gradient
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          // SafeArea to ensure content is not obscured by system UI
          child: SizedBox.expand(
            child: SafeArea(
              child: SingleChildScrollView(
                // Scrollable content
                child: Padding(
                  padding:
                      EdgeInsets.all(LCSizes.lg), // Padding around the content
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align content to the start
                    children: [
                      // Story title card with a fun shape
                      Container(
                        padding: EdgeInsets.all(
                            LCSizes.md), // Padding inside the card
                        decoration: BoxDecoration(
                          color: LCColors.white
                              .withOpacity(0.15), // Semi-transparent background
                          borderRadius: BorderRadius.circular(
                              LCSizes.borderRadiusLg + 8), // Rounded corners
                          border: Border.all(
                            color:
                                LCColors.white.withOpacity(0.3), // Border color
                            width: 1.5, // Border width
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align content to the start
                          children: [
                            // Row for the story title and icon
                            Row(
                              children: [
                                Icon(Icons.book,
                                    color: LCColors.warning,
                                    size: LCSizes.iconMd), // Book icon
                                SizedBox(width: LCSizes.sm), // Spacing
                                Text(
                                  "Devin's Traffic Trouble", // Story title
                                  style: GoogleFonts.poppins(
                                    fontSize: LCSizes.fontSizeLg + 2,
                                    fontWeight: FontWeight.bold,
                                    color: textColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: LCSizes.sm + 2), // Spacing
                            // Row for completion status
                            Row(
                              children: [
                                Icon(Icons.check_circle,
                                    color: LCColors.success,
                                    size: LCSizes.iconMd - 2), // Check icon
                                SizedBox(width: LCSizes.sm), // Spacing
                                Text(
                                  "Completed!", // Completion text
                                  style: GoogleFonts.poppins(
                                    fontSize: LCSizes.fontSizeMd,
                                    fontWeight: FontWeight.w500,
                                    color: textColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: LCSizes.xs + 2), // Spacing
                            // Row for time taken
                            Row(
                              children: [
                                Icon(Icons.timer,
                                    color: LCColors.warning,
                                    size: LCSizes.iconMd - 2), // Timer icon
                                SizedBox(width: LCSizes.sm), // Spacing
                                Text(
                                  "5 minutes 30 seconds", // Time taken
                                  style: GoogleFonts.poppins(
                                    fontSize: LCSizes.fontSizeMd,
                                    fontWeight: FontWeight.w500,
                                    color: textColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: LCSizes.lg), // Spacing

                      // Score section with a progress bar
                      _buildSectionTitle(
                        " Your Score", // Section title
                        icon: Icons.star, // Star icon
                        iconColor: LCColors.warning, // Icon color
                      ),
                      SizedBox(height: LCSizes.sm + 4), // Spacing
                      Container(
                        padding: EdgeInsets.all(
                            LCSizes.md), // Padding inside the container
                        decoration: BoxDecoration(
                          color: LCColors.white
                              .withOpacity(0.15), // Semi-transparent background
                          borderRadius: BorderRadius.circular(
                              LCSizes.borderRadiusLg + 8), // Rounded corners
                        ),
                        child: Column(
                          children: [
                            // Row for the progress bar and score
                            Row(
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        LCSizes.borderRadiusMd +
                                            2), // Rounded corners
                                    child: LinearProgressIndicator(
                                      value: 0.7, // Progress value (70%)
                                      backgroundColor: LCColors.white
                                          .withOpacity(0.2), // Background color
                                      color: LCColors.primary, // Progress color
                                      minHeight:
                                          14, // Height of the progress bar
                                    ),
                                  ),
                                ),
                                SizedBox(width: LCSizes.md), // Spacing
                                // Score display
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: LCSizes.sm + 4,
                                      vertical: LCSizes.xs + 2),
                                  decoration: BoxDecoration(
                                    color: LCColors.primary, // Background color
                                    borderRadius: BorderRadius.circular(LCSizes
                                        .borderRadiusMd), // Rounded corners
                                  ),
                                  child: Text(
                                    "7/10", // Score text
                                    style: GoogleFonts.poppins(
                                      fontSize: LCSizes.fontSizeLg,
                                      fontWeight: FontWeight.bold,
                                      color: LCColors.white, // Text color
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: LCSizes.lg), // Spacing

                      // Performance breakdown section
                      _buildSectionTitle(
                        " What Your Child Learned", // Section title
                        icon: Icons.lightbulb_outline, // Lightbulb icon
                        iconColor: LCColors.warning, // Icon color
                      ),
                      SizedBox(height: LCSizes.sm + 4), // Spacing
                      // Performance items (correct/incorrect answers)
                      _buildPerformanceItem(
                        icon: Icons.security,
                        title: "Road rules and Safety",
                        correct: true,
                        iconColor: LCColors.success,
                      ),
                      _buildPerformanceItem(
                        icon: Icons.people,
                        title: "Traffic Law",
                        correct: true,
                        iconColor: LCColors.success,
                      ),

                      SizedBox(height: LCSizes.lg), // Spacing

                      SizedBox(height: LCSizes.spaceBtwSections), // Spacing

                      // Play again button
                      Center(
                        child: Container(
                          height: 60,
                          width: 220,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                LCSizes.borderRadiusLg + 18), // Rounded corners
                            boxShadow: [
                              BoxShadow(
                                color: LCColors.primary
                                    .withOpacity(0.5), // Shadow color
                                blurRadius: 15, // Shadow blur
                                offset: Offset(0, 5), // Shadow offset
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context); // Navigate back on press
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  LCColors.primary, // Button background color
                              foregroundColor:
                                  LCColors.white, // Button text color
                              padding: EdgeInsets.symmetric(
                                  vertical: LCSizes.sm + 4), // Button padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    LCSizes.borderRadiusLg +
                                        18), // Rounded corners
                              ),
                              elevation: 0, // No elevation
                            ),
                            child: Row(
                              mainAxisSize:
                                  MainAxisSize.min, // Minimize row size
                              children: [
                                Icon(Icons.replay,
                                    size: LCSizes.iconMd), // Replay icon
                                SizedBox(width: LCSizes.sm), // Spacing
                                Text(
                                  "Play Again!", // Button text
                                  style: GoogleFonts.poppins(
                                    fontSize: LCSizes.fontSizeLg,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }

  // Helper method to build a section title with an icon
  Widget _buildSectionTitle(
    String title, {
    required IconData icon,
    required Color iconColor,
  }) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: LCSizes.iconMd), // Icon
        SizedBox(width: LCSizes.sm), // Spacing
        Text(
          title, // Title text
          style: GoogleFonts.poppins(
            fontSize: LCSizes.fontSizeLg,
            fontWeight: FontWeight.bold,
            color: LCColors.white, // Text color
          ),
        ),
      ],
    );
  }

  // Helper method to build a performance item (correct/incorrect answer)
  Widget _buildPerformanceItem({
    required IconData icon,
    required String title,
    required bool correct,
    required Color iconColor,
    String? message,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: LCSizes.sm + 4), // Margin at the bottom
      padding: EdgeInsets.symmetric(
          horizontal: LCSizes.md,
          vertical: LCSizes.sm + 6), // Padding inside the container
      decoration: BoxDecoration(
        color: LCColors.white.withOpacity(0.15), // Semi-transparent background
        borderRadius: BorderRadius.circular(
            LCSizes.borderRadiusLg + 4), // Rounded corners
        border: Border.all(
          color: correct
              ? LCColors.success.withOpacity(0.4) // Green border for correct
              : LCColors.error.withOpacity(0.4), // Red border for incorrect
          width: 1.5, // Border width
        ),
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align content to the start
        children: [
          // Icon container
          Container(
            padding: EdgeInsets.all(LCSizes.sm), // Padding around the icon
            decoration: BoxDecoration(
              color: correct
                  ? LCColors.success
                      .withOpacity(0.2) // Green background for correct
                  : LCColors.error
                      .withOpacity(0.2), // Red background for incorrect
              shape: BoxShape.circle, // Circular shape
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: LCSizes.iconMd - 2, // Icon size
            ),
          ),
          SizedBox(width: LCSizes.sm + 6), // Spacing
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align content to the start
              children: [
                Text(
                  title, // Title text
                  style: GoogleFonts.poppins(
                    fontSize: LCSizes.fontSizeMd,
                    fontWeight: FontWeight.w600,
                    color: LCColors.white, // Text color
                  ),
                ),
                if (message != null) ...[
                  SizedBox(height: LCSizes.xs), // Spacing
                  Text(
                    message, // Additional message
                    style: GoogleFonts.poppins(
                      fontSize: LCSizes.fontSizeSm,
                      color: LCColors.white.withOpacity(0.8), // Text color
                    ),
                  ),
                ],
              ],
            ),
          ),
          // Correct/incorrect icon
          Icon(
            correct ? Icons.check_circle : Icons.error,
            color: correct ? LCColors.success : LCColors.error,
            size: LCSizes.iconMd,
          ),
        ],
      ),
    );
  }
}
