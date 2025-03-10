import 'package:flutter/material.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:lexchoice/utils/constants/sizes.dart';

class EditProfileScreen extends StatelessWidget {
  final String initialName;
  final String initialEmail;
  final String initialPassword;

  // Constructor to accept initial values
  const EditProfileScreen({
    super.key,
    required this.initialName,
    required this.initialEmail,
    required this.initialPassword,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: initialName);
    TextEditingController emailController =
        TextEditingController(text: initialEmail);
    TextEditingController passwordController =
        TextEditingController(text: initialPassword);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Profile",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
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
            _buildSectionTitle("Change Display Name"),
            _buildTextField(
                controller: nameController, hintText: "Enter new display name"),
            _buildSectionTitle("Change Email"),
            _buildTextField(
                controller: emailController,
                hintText: "Enter new email",
                keyboardType: TextInputType.emailAddress),
            _buildSectionTitle("Change Password"),
            _buildTextField(
                controller: passwordController,
                hintText: "Enter new password",
                keyboardType: TextInputType.visiblePassword,
                obscureText: true),
            const SizedBox(height: LCSizes.lg),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Profile Updated!")),
                    );
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: LCColors.buttonPrimary,
                    padding:
                        EdgeInsets.symmetric(vertical: LCSizes.buttonHeight),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(LCSizes.buttonRadius),
                    ),
                  ),
                  child: Text(
                    "Update",
                    style: TextStyle(
                      fontSize: LCSizes.fontSizeLg,
                      fontWeight: FontWeight.bold,
                      color: LCColors.textWhite,
                    ),
                  ),
                ),
              ),
            ),
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
          fontSize: LCSizes.fontSizeLg,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: LCSizes.sm),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: LCSizes.fontSizeMd, color: LCColors.textSecondary),
          filled: true,
          fillColor: LCColors.light,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(LCSizes.borderRadiusMd),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(
              horizontal: LCSizes.md, vertical: LCSizes.sm),
        ),
        style: TextStyle(
            fontSize: LCSizes.fontSizeMd, color: LCColors.textPrimary),
      ),
    );
  }
}
