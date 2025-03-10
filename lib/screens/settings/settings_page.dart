import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:lexchoice/utils/constants/sizes.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lexchoice/screens/authentication/screens/login/login.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _soundEffectsEnabled = true;
  bool _backgroundMusicEnabled = true;
  double _volume = 1.0;

  void _toggleNotifications(bool value) {
    setState(() {
      _notificationsEnabled = value;
    });
  }

  void _toggleSoundEffects(bool value) {
    setState(() {
      _soundEffectsEnabled = value;
    });
  }

  void _toggleBackgroundMusic(bool value) {
    setState(() {
      _backgroundMusicEnabled = value;
    });
  }

  void _logout() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Logging out...')),
    );
    Get.offAll(() => const LoginScreen());
  }

  // Function to launch URL
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open the website')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: LCColors.primary,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(LCSizes.md),
        child: ListView(
          children: [
            _buildSwitchTile(
              title: 'Enable Notifications',
              value: _notificationsEnabled,
              onChanged: _toggleNotifications,
            ),
            _buildSectionTitle('Sound & Music 🎵'),
            _buildSwitchTile(
              title: 'Sound Effects',
              value: _soundEffectsEnabled,
              onChanged: _toggleSoundEffects,
            ),
            _buildSwitchTile(
              title: 'Background Music',
              value: _backgroundMusicEnabled,
              onChanged: _toggleBackgroundMusic,
            ),
            _buildVolumeSlider(),
            _buildSectionTitle('About & Help ❓'),
            _buildInfoTile('Game Instructions', Icons.help_outline),
            _buildInfoTile('Privacy Policy & Terms', Icons.lock_outline),

            // Updated "Support & Contact Info" to open a website
            _buildInfoTile(
              'Support & Contact Info',
              Icons.contact_support,
              onTap: () {
                _launchURL('https://lex-choice-website.vercel.app/');
              },
            ),

            const SizedBox(height: 20),
            _buildLogoutButton(),
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
          fontWeight: FontWeight.w900,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: TextStyle(
          fontSize: LCSizes.fontSizeMd,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: LCColors.primary,
        inactiveTrackColor: LCColors.grey,
        activeTrackColor: LCColors.light,
      ),
    );
  }

  Widget _buildVolumeSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Volume',
          style: TextStyle(
            fontSize: LCSizes.fontSizeMd,
            fontWeight: FontWeight.w500,
          ),
        ),
        Slider(
          value: _volume,
          min: 0.0,
          max: 1.0,
          divisions: 10,
          label: '${(_volume * 100).round()}%',
          onChanged: (double value) {
            setState(() {
              _volume = value;
            });
          },
          activeColor: LCColors.primary,
          inactiveColor: LCColors.grey,
        ),
      ],
    );
  }

  Widget _buildInfoTile(String title, IconData icon, {VoidCallback? onTap}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: LCColors.primary),
      title: Text(
        title,
        style: TextStyle(
          fontSize: LCSizes.fontSizeMd,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap ??
          () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$title tapped')),
            );
          },
    );
  }

  Widget _buildLogoutButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _logout,
        style: ElevatedButton.styleFrom(
          backgroundColor: LCColors.buttonPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(LCSizes.buttonRadius),
          ),
          padding: EdgeInsets.symmetric(vertical: LCSizes.buttonHeight),
        ),
        child: Text(
          'Logout',
          style: TextStyle(
            color: LCColors.textWhite,
            fontSize: LCSizes.fontSizeMd,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
