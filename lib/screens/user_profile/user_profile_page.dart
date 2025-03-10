import 'package:flutter/material.dart';
import 'package:lexchoice/screens/user_profile/edit_profile_screen.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:lexchoice/utils/constants/sizes.dart';
import 'package:get/get.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Assuming these are the current user details
    String currentName = "John Doe";
    String currentEmail = "john.doe@example.com";
    String currentPassword = "password123"; // Just for demonstration

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "User Profile",
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
            // Profile Information
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: LCColors.light,
                    backgroundImage: AssetImage('assets/avatars/avatar1.png'),
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

            // Editable Settings
            _buildSettingsTile(context, "Change Display Name", Icons.edit, () {
              // Passing required parameters to the EditProfileScreen
              Get.to(() => EditProfileScreen(
                    initialName: currentName,
                    initialEmail: currentEmail,
                    initialPassword: currentPassword,
                  ));
            }),
            _buildSettingsTile(context, "Change Email", Icons.email, () {
              // Passing required parameters to the EditProfileScreen
              Get.to(() => EditProfileScreen(
                    initialName: currentName,
                    initialEmail: currentEmail,
                    initialPassword: currentPassword,
                  ));
            }),
            _buildSettingsTile(context, "Change Password", Icons.lock, () {
              // Passing required parameters to the EditProfileScreen
              Get.to(() => EditProfileScreen(
                    initialName: currentName,
                    initialEmail: currentEmail,
                    initialPassword: currentPassword,
                  ));
            }),

            const SizedBox(height: 20),

            // Gameplay Stats
            Text(
              "Achievements & Badges",
              style: TextStyle(
                fontSize: LCSizes.fontSizeMd,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
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

  // Reusable Settings Tile
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

  // Reusable Badge Widget
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
