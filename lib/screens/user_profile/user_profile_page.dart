import 'package:flutter/material.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:lexchoice/utils/constants/sizes.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    backgroundImage: AssetImage(
                        'assets/avatars/avatar1.png'), // Default avatar
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "John Doe", // Sample Name
                    style: TextStyle(
                      fontSize: LCSizes.fontSizeMd,
                      fontWeight: FontWeight.w700,
                      color: Colors.white, // Changed to white
                    ),
                  ),
                  Text(
                    "john.doe@example.com", // Sample Email
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
            _buildSettingsTile(context, "Change Display Name", Icons.edit),
            _buildSettingsTile(context, "Change Email", Icons.email),
            _buildSettingsTile(context, "Change Password", Icons.lock),

            const SizedBox(height: 20),

            // Gameplay Stats
            Text(
              "Achievements & Badges",
              style: TextStyle(
                fontSize: LCSizes.fontSizeMd,
                fontWeight: FontWeight.w700,
                color: Colors.white, // Changed to white
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
  Widget _buildSettingsTile(BuildContext context, String title, IconData icon) {
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
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$title tapped!')),
        );
      },
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
