import 'package:flutter/material.dart';
import 'screens/welcome_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const LexChoiceApp());
}

class LexChoiceApp extends StatelessWidget {
  const LexChoiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LexChoice',
      theme: ThemeData.dark(),
      home: AnimatedSplashScreen(
        splash: 'assets/videos/splash_screen.gif',
        splashIconSize: 2000.0,
        centered: true,
        nextScreen: const SplashScreen(),
        backgroundColor: Colors.black,
        duration: 5000,
      ),
    );
  }
}
