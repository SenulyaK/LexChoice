import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lexchoice/game/widgets/audio_manager.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:lexchoice/utils/constants/sizes.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lexchoice/screens/authentication/screens/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _backgroundMusicEnabled = true;
  double _volume = 1.0;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _notificationsEnabled = prefs.getBool('notificationsEnabled') ?? true;
      _backgroundMusicEnabled = prefs.getBool('backgroundMusicEnabled') ?? true;
    });
  }

  Future<void> _saveSetting(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  void _toggleNotifications(bool value) {
    setState(() {
      _notificationsEnabled = value;
    });
    _saveSetting('notificationsEnabled', value);
  }

  void _toggleBackgroundMusic(bool value) {
    setState(() {
      _backgroundMusicEnabled = value;
    });
    _saveSetting('backgroundMusicEnabled', value);
    audioManager.toggleMuteBackgroundMusic(value);
  }

  void _logout() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Logging out...')),
    );
    Get.offAll(() => const LoginScreen());
  }

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0), // Adjust the height as needed
        child: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Settings',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 30.0, // Larger font size
            ),
          ),
          backgroundColor: Colors.transparent,
          toolbarHeight: 120,
          elevation: 0,
          centerTitle: true, // Align title to the left
          titleSpacing:
              20.0, // Optional, to add some space between the title and the left edge
        ),
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
                  : LCColors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(LCSizes.md),
        child: ListView(
          children: [
            const SizedBox(height: 30),
            _buildSwitchTile('Enable Notifications', _notificationsEnabled,
                _toggleNotifications),
            _buildSwitchTile('Background Music', _backgroundMusicEnabled,
                _toggleBackgroundMusic),
            const SizedBox(height: 50),
            _buildVolumeSlider(),
            _buildSectionTitle('About & Help ❓'),
            const SizedBox(height: 20),
            _buildInfoTile('Game Instructions', Icons.help_outline),
            _buildInfoTile('Privacy Policy & Terms', Icons.lock_outline),
            _buildInfoTile('Support & Contact Info', Icons.contact_support,
                onTap: () =>
                    _launchURL('https://lex-choice-website.vercel.app/')),
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
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: LCSizes.fontSizeLg,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchTile(String title, bool value, Function(bool) onChanged) {
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

  Widget _buildInfoTile(String title, IconData icon, {VoidCallback? onTap}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: LCColors.primary),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.grey,
          fontSize: LCSizes.fontSizeSm,
          fontWeight: FontWeight.bold,
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
          backgroundColor: LCColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              LCSizes.buttonRadius,
            ),
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

  // Builds volume control slider
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
}
