import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lexchoice/utils/constants/colors.dart';

void showExitDialog(BuildContext context, bool darkMode) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: darkMode ? LCColors.secondary : LCColors.light,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text(
        "Exit LexChoice?",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: darkMode ? LCColors.white : LCColors.black,
        ),
      ),
      content: Text(
        "Are you sure you want to quit the app?",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: darkMode ? LCColors.grey : LCColors.black,
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          style: ElevatedButton.styleFrom(
            backgroundColor: LCColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: 35, vertical: 12), // Wider and shorter
            side: BorderSide.none, // Remove the border
          ),
          child: const Text("Cancel", style: TextStyle(color: Colors.white)),
        ),
        ElevatedButton(
          onPressed: () {
            if (Platform.isAndroid) {
              SystemNavigator.pop();
            } else if (Platform.isIOS) {
              exit(0);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: 40, vertical: 12), // Wider and shorter
            side: BorderSide.none, // Remove the border
          ),
          child: const Text("Quit", style: TextStyle(color: Colors.white)),
        ),
      ],
    ),
  );
}
