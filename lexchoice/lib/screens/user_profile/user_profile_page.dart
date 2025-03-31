import 'package:flutter/material.dart';
import 'package:lexchoice/models/user_model.dart';
import 'package:lexchoice/services/api_service.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:lexchoice/utils/constants/sizes.dart';
import 'package:get/get.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final ApiService _apiService = ApiService();
  UserModel? _userData;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      final userData = await _apiService.getUserProfile();
      setState(() {
        _userData = userData;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
      // If token is invalid or expired, redirect to login
      if (e.toString().contains('No authentication token found') ||
          e.toString().contains('Invalid or expired token')) {
        // Navigate to login page
        Get.offAllNamed('/login'); // Make sure you have this route defined
      }
    }
  }

  // ignore: unused_element
  Future<void> _handleLogout() async {
    try {
      await _apiService.logoutUser();
      Get.offAllNamed('/login'); // Navigate to login page after logout
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error during logout: $e')),
      );
    }
  }

  Future<void> _showUpdateUsernameDialog() async {
    final TextEditingController controller = TextEditingController(text: _userData?.username);
    
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update Username'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'New Username',
            hintText: 'Enter new username',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              try {
                await _apiService.updateUsername(controller.text);
                Navigator.pop(context);
                _loadUserProfile(); // Reload profile data
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Username updated successfully')),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error updating username: $e')),
                );
              }
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }

  Future<void> _showUpdateEmailDialog() async {
    final TextEditingController controller = TextEditingController(text: _userData?.email);
    
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update Email'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'New Email',
            hintText: 'Enter new email',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              try {
                await _apiService.updateEmail(controller.text);
                Navigator.pop(context);
                _loadUserProfile(); // Reload profile data
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Email updated successfully')),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error updating email: $e')),
                );
              }
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }

  Future<void> _showUpdatePasswordDialog() async {
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update Password'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: currentPasswordController,
              decoration: const InputDecoration(
                labelText: 'Current Password',
                hintText: 'Enter current password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: newPasswordController,
              decoration: const InputDecoration(
                labelText: 'New Password',
                hintText: 'Enter new password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: confirmPasswordController,
              decoration: const InputDecoration(
                labelText: 'Confirm New Password',
                hintText: 'Confirm new password',
              ),
              obscureText: true,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              if (newPasswordController.text != confirmPasswordController.text) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('New passwords do not match')),
                );
                return;
              }

              try {
                await _apiService.updatePassword(
                  currentPasswordController.text,
                  newPasswordController.text,
                );
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Password updated successfully')),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error updating password: $e')),
                );
              }
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0), // Adjust the height as needed
        child: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Profile',
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
                  : LCColors.darkGrey,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(LCSizes.md),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _error != null
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Error: $_error',
                          style: const TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _loadUserProfile,
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
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
                              _userData?.username ?? 'Unknown',
                              style: TextStyle(
                                fontSize: LCSizes.fontSizeMd,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              _userData?.email ?? 'No email',
                              style: TextStyle(
                                fontSize: LCSizes.fontSizeSm,
                                color: LCColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildSettingsTile(
                        context,
                        "Change Display Name",
                        Icons.edit,
                        _showUpdateUsernameDialog,
                      ),
                      _buildSettingsTile(
                        context,
                        "Change Email",
                        Icons.email,
                        _showUpdateEmailDialog,
                      ),
                      _buildSettingsTile(
                        context,
                        "Change Password",
                        Icons.lock,
                        _showUpdatePasswordDialog,
                      ),
                      const SizedBox(height: 20),
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
