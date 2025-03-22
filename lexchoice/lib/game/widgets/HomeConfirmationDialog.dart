import 'package:flutter/material.dart';
import 'package:lexchoice/utils/constants/colors.dart';

class HomeConfirmationDialog {
  static void showHomeConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: LCColors.secondary, // Dialog background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          "Go Back?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: LCColors.grey, // Title text color
          ),
        ),
        content: Text(
          "Are you sure you want to go back to the previous screen?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: LCColors.white, // Content text color
          ),
        ),
        actionsAlignment: MainAxisAlignment.spaceAround,
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(), // Close the dialog
            style: ElevatedButton.styleFrom(
              backgroundColor: LCColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              side: BorderSide.none,
            ),
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              Navigator.of(context).pop(); // Go back to the previous screen
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              side: BorderSide.none,
            ),
            child: const Text(
              "Go Back",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
