import 'package:flutter/material.dart';

class CongratulationsDialog {
  static void showCongratulationsDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("🎉 Congratulations!", textAlign: TextAlign.center),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                  "assets/stories/lila/congrats.gif"), // Add your own GIF
              SizedBox(height: 10),
              Text(
                "You've successfully completed the story!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                Navigator.pop(context); // Go back to home screen
              },
              child: Text("OK", style: TextStyle(fontSize: 16)),
            ),
          ],
        );
      },
    );
  }
}
