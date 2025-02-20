import 'package:flutter/material.dart';
import 'package:lexchoice/screens/authentication/screens/onboarding.dart';
import 'package:lexchoice/utils/theme/theme.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: LCAppTheme.lightTheme,
      darkTheme: LCAppTheme.darkTheme,
      home: const OnboardingScreen(),
    );
  }
}