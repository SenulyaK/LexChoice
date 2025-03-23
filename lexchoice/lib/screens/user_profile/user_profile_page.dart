import 'package:flutter/material.dart';
import 'package:lexchoice/screens/user_profile/edit_profile_screen.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:lexchoice/utils/constants/sizes.dart';
import 'package:get/get.dart';

// Stateless widget representing the user's profile page
class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulated user data (should be replaced with actual user data retrieval)
    String currentName = "John Doe";
    String currentEmail = "john.doe@example.com";
    String currentPassword = "password123"; // Just for demonstration

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0), // Adjust the height as needed
        child: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Profile',
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              // Dynamically set background gradient based on theme
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
            // Display user profile information
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: LCColors.light,
                    backgroundImage: AssetImage(
                        'assets/avatars/avatar1.png'), // Placeholder avatar
                  ),
                  const SizedBox(height: 10),
                  Text(
                    currentName,
                    style: TextStyle(
                      fontSize: LCSizes.fontSizeMd,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    currentEmail,
                    style: TextStyle(
                      fontSize: LCSizes.fontSizeSm,
                      color: LCColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Settings options for editing profile details
            _buildSettingsTile(context, "Change Display Name", Icons.edit, () {
              Get.to(() => EditProfileScreen(
                    initialName: currentName,
                    initialEmail: currentEmail,
                    initialPassword: currentPassword,
                  ));
            }),
            _buildSettingsTile(context, "Change Email", Icons.email, () {
              Get.to(() => EditProfileScreen(
                    initialName: currentName,
                    initialEmail: currentEmail,
                    initialPassword: currentPassword,
                  ));
            }),
            _buildSettingsTile(context, "Change Password", Icons.lock, () {
              Get.to(() => EditProfileScreen(
                    initialName: currentName,
                    initialEmail: currentEmail,
                    initialPassword: currentPassword,
                  ));
            }),

            const SizedBox(height: 20),

            // Section displaying achievements and badges
            Text(
              "Achievements & Badges",
              style: TextStyle(
                fontSize: LCSizes.fontSizeMd,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBadge("🏆", "Champion"),
                _buildBadge("🎖️", "Explorer"),
                _buildBadge("🏅", "Master"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Reusable widget for user settings options
  Widget _buildSettingsTile(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: LCColors.primary),
      title: Text(
        title,
        style: TextStyle(
            fontSize: LCSizes.fontSizeMd, fontWeight: FontWeight.w500),
      ),
      trailing: Icon(Icons.arrow_forward_ios,
          size: 16, color: LCColors.textSecondary),
      onTap: onTap,
    );
  }

  // Reusable widget to display a badge with an emoji and label
  Widget _buildBadge(String emoji, String label) {
    return Column(
      children: [
        Text(emoji, style: TextStyle(fontSize: 30)),
        Text(label,
            style: TextStyle(
                fontSize: LCSizes.fontSizeSm, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
