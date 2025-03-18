import 'package:flutter/material.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:lexchoice/utils/constants/sizes.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailedFeedbackScreenTopic4 extends StatelessWidget {
  const DetailedFeedbackScreenTopic4({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = LCColors.textWhite;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "🎉 Great Job! 🎉",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: LCColors.textWhite),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDarkMode
                ? [LCColors.secondary, LCColors.background]
                : [LCColors.white, LCColors.darkGrey],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(LCSizes.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Story title card - more fun shape
                  Container(
                    padding: EdgeInsets.all(LCSizes.md),
                    decoration: BoxDecoration(
                      color: LCColors.white.withOpacity(0.15),
                      borderRadius:
                          BorderRadius.circular(LCSizes.borderRadiusLg + 8),
                      border: Border.all(
                        color: LCColors.white.withOpacity(0.3),
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.book,
                                color: LCColors.warning, size: LCSizes.iconMd),
                            SizedBox(width: LCSizes.sm),
                            Text(
                              "Dillon's Traffic Trouble",
                              style: GoogleFonts.poppins(
                                fontSize: LCSizes.fontSizeLg + 2,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: LCSizes.sm + 2),
                        Row(
                          children: [
                            Icon(Icons.check_circle,
                                color: LCColors.success,
                                size: LCSizes.iconMd - 2),
                            SizedBox(width: LCSizes.sm),
                            Text(
                              "Completed!",
                              style: GoogleFonts.poppins(
                                fontSize: LCSizes.fontSizeMd,
                                fontWeight: FontWeight.w500,
                                color: textColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: LCSizes.xs + 2),
                        Row(
                          children: [
                            Icon(Icons.timer,
                                color: LCColors.warning,
                                size: LCSizes.iconMd - 2),
                            SizedBox(width: LCSizes.sm),
                            Text(
                              "5 minutes 30 seconds",
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

                  SizedBox(height: LCSizes.lg),

                  // Score section - more fun for kids
                  _buildSectionTitle(
                    "⭐ Your Score",
                    icon: Icons.star,
                    iconColor: LCColors.warning,
                  ),
                  SizedBox(height: LCSizes.sm + 4),
                  Container(
                    padding: EdgeInsets.all(LCSizes.md),
                    decoration: BoxDecoration(
                      color: LCColors.white.withOpacity(0.15),
                      borderRadius:
                          BorderRadius.circular(LCSizes.borderRadiusLg + 8),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    LCSizes.borderRadiusMd + 2),
                                child: LinearProgressIndicator(
                                  value: 0.7,
                                  backgroundColor:
                                      LCColors.white.withOpacity(0.2),
                                  color: LCColors.primary,
                                  minHeight: 14,
                                ),
                              ),
                            ),
                            SizedBox(width: LCSizes.md),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: LCSizes.sm + 4,
                                  vertical: LCSizes.xs + 2),
                              decoration: BoxDecoration(
                                color: LCColors.primary,
                                borderRadius: BorderRadius.circular(
                                    LCSizes.borderRadiusMd),
                              ),
                              child: Text(
                                "7/10",
                                style: GoogleFonts.poppins(
                                  fontSize: LCSizes.fontSizeLg,
                                  fontWeight: FontWeight.bold,
                                  color: LCColors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: LCSizes.lg),

                  // Performance breakdown - kid friendly
                  _buildSectionTitle(
                    "🎯 What You Learned",
                    icon: Icons.lightbulb_outline,
                    iconColor: LCColors.warning,
                  ),
                  SizedBox(height: LCSizes.sm + 4),
                  _buildPerformanceItem(
                    icon: Icons.security,
                    title: "Online Safety",
                    correct: true,
                    iconColor: LCColors.success,
                  ),
                  _buildPerformanceItem(
                    icon: Icons.people,
                    title: "Cyberbullying Awareness",
                    correct: true,
                    iconColor: LCColors.success,
                  ),
                  _buildPerformanceItem(
                    icon: Icons.lock,
                    title: "Digital Privacy",
                    correct: false,
                    message: "Be careful when sharing personal info!",
                    iconColor: LCColors.error,
                  ),

                  SizedBox(height: LCSizes.lg),

                  // Tip card - more fun for kids
                  Container(
                    padding: EdgeInsets.all(LCSizes.md),
                    decoration: BoxDecoration(
                      color: LCColors.warning.withOpacity(0.15),
                      borderRadius:
                          BorderRadius.circular(LCSizes.borderRadiusLg + 8),
                      border: Border.all(
                        color: LCColors.warning.withOpacity(0.4),
                        width: 2,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.emoji_events,
                          color: LCColors.warning,
                          size: LCSizes.iconLg,
                        ),
                        SizedBox(width: LCSizes.sm + 4),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Awesome work!",
                                style: GoogleFonts.poppins(
                                  fontSize: LCSizes.fontSizeLg,
                                  fontWeight: FontWeight.bold,
                                  color: LCColors.white,
                                ),
                              ),
                              SizedBox(height: LCSizes.xs + 2),
                              Text(
                                "You're becoming a legal expert! Your next mission: Learn more about online safety.",
                                style: GoogleFonts.poppins(
                                  fontSize: LCSizes.fontSizeMd,
                                  color: LCColors.white.withOpacity(0.9),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: LCSizes.spaceBtwSections),

                  // Play again button - more fun and kid-friendly
                  Center(
                    child: Container(
                      height: 60,
                      width: 220,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(LCSizes.borderRadiusLg + 18),
                        boxShadow: [
                          BoxShadow(
                            color: LCColors.primary.withOpacity(0.5),
                            blurRadius: 15,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: LCColors.primary,
                          foregroundColor: LCColors.white,
                          padding:
                              EdgeInsets.symmetric(vertical: LCSizes.sm + 4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                LCSizes.borderRadiusLg + 18),
                          ),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.replay, size: LCSizes.iconMd),
                            SizedBox(width: LCSizes.sm),
                            Text(
                              "Play Again!",
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
      ),
    );
  }

  Widget _buildSectionTitle(
    String title, {
    required IconData icon,
    required Color iconColor,
  }) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: LCSizes.iconMd),
        SizedBox(width: LCSizes.sm),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: LCSizes.fontSizeLg,
            fontWeight: FontWeight.bold,
            color: LCColors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildPerformanceItem({
    required IconData icon,
    required String title,
    required bool correct,
    required Color iconColor,
    String? message,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: LCSizes.sm + 4),
      padding: EdgeInsets.symmetric(
          horizontal: LCSizes.md, vertical: LCSizes.sm + 6),
      decoration: BoxDecoration(
        color: LCColors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(LCSizes.borderRadiusLg + 4),
        border: Border.all(
          color: correct
              ? LCColors.success.withOpacity(0.4)
              : LCColors.error.withOpacity(0.4),
          width: 1.5,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(LCSizes.sm),
            decoration: BoxDecoration(
              color: correct
                  ? LCColors.success.withOpacity(0.2)
                  : LCColors.error.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: LCSizes.iconMd - 2,
            ),
          ),
          SizedBox(width: LCSizes.sm + 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: LCSizes.fontSizeMd,
                    fontWeight: FontWeight.w600,
                    color: LCColors.white,
                  ),
                ),
                if (message != null) ...[
                  SizedBox(height: LCSizes.xs),
                  Text(
                    message,
                    style: GoogleFonts.poppins(
                      fontSize: LCSizes.fontSizeSm,
                      color: LCColors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ],
            ),
          ),
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
