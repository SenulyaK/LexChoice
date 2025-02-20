import 'package:flutter/material.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:lexchoice/utils/theme/theme.dart';
import 'screens/welcome_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lexchoice/app.dart';

void main() {
  runApp(const App());
}

class LexChoiceApp extends StatelessWidget {
  const LexChoiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: LCAppTheme.lightTheme,
      darkTheme: LCAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      title: 'LexChoice',
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
