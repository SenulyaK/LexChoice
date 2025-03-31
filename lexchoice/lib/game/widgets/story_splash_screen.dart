import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lexchoice/utils/constants/colors.dart';

class StorySplashScreen extends StatefulWidget {
  final String storyTitle;
  final String splashGif;
  final Widget gameScreen;
  final int splashDuration;
  final int gameID; // Optional duration for splash screen display

  const StorySplashScreen({
    Key? key,
    required this.storyTitle,
    required this.splashGif,
    required this.gameScreen,
    required this.gameID,
    this.splashDuration = 3, // Default to 3 seconds
  }) : super(key: key);

  @override
  _StorySplashScreenState createState() => _StorySplashScreenState();
}

class _StorySplashScreenState extends State<StorySplashScreen> {
  double _opacity = 0.0; // For fade-in effect

  @override
  void initState() {
    super.initState();
    // Fade-in animation
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    // Navigate to the next screen after the splash screen
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: widget.splashDuration), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => widget.gameScreen),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? LCColors.secondary : Colors.white,
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(milliseconds: 1000), // Fade-in duration
          child: Image.asset(
            widget.splashGif,
            fit: BoxFit.cover, // Make the GIF cover the whole screen
            width: double.infinity, // Make the image width full screen
            height: double.infinity, // Make the image height full screen
          ),
        ),
      ),
    );
  }
}
