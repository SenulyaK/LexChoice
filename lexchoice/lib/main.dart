import 'package:flutter/material.dart';
import 'screens/welcome_page.dart'; 

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
      home: const SplashScreen(), 
    );
  }
}
