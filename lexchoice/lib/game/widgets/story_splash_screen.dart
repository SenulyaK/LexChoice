import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class StorySplashScreen extends StatefulWidget {
  final String storyTitle;
  final String splashGif;
  final Widget gameScreen;

  const StorySplashScreen({
    Key? key,
    required this.storyTitle,
    required this.splashGif,
    required this.gameScreen,
  }) : super(key: key);

  @override
  _StorySplashScreenState createState() => _StorySplashScreenState();
}

class _StorySplashScreenState extends State<StorySplashScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => widget.gameScreen),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(widget.splashGif, fit: BoxFit.cover),
      ),
    );
  }
}
