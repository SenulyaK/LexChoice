import 'package:flutter/material.dart';
import 'package:lexchoice/screens/authentication/screens/onboarding.dart';
import 'package:lexchoice/utils/theme/theme.dart';
import 'package:get/get.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: LCAppTheme.lightTheme,
      darkTheme: LCAppTheme.darkTheme,
      home: AnimatedSplashScreen(
        splash: 'assets/videos/splash_screen.gif',
        splashIconSize: 2000.0,
        centered: true,
        nextScreen: const OnboardingScreen(),
        backgroundColor: Colors.black,
        duration: 4000,
      ),
    );
  }
}