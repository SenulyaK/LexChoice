import 'package:flutter/material.dart';

class LilaGameScreen extends StatefulWidget {
  @override
  _LilaGameScreenState createState() => _LilaGameScreenState();
}

class _LilaGameScreenState extends State<LilaGameScreen> {
  int _currentGifIndex = 1;
  final int _totalGifs = 15;
  double _opacity = 1.0;

  void _nextGif() {
    if (_currentGifIndex < _totalGifs) {
      setState(() {
        _opacity = 0.0; // Fade out
      });

      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          _currentGifIndex++;
          _opacity = 1.0; // Fade in
        });
      });
    }
  }

  void _previousGif() {
    if (_currentGifIndex > 1) {
      setState(() {
        _opacity = 0.0; // Fade out
      });

      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          _currentGifIndex--;
          _opacity = 1.0; // Fade in
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Title
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Lila's Choice", // Your title text
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Title color
                ),
              ),
            ),
          ),

          // Gif Image
          AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: _opacity,
            child: Center(
              child: Image.asset(
                'assets/stories/lila/lila_$_currentGifIndex.gif',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Back Button
          Positioned(
            bottom: 20,
            left: 30,
            child: ElevatedButton(
              onPressed: _previousGif,
              child: Text("Back"),
            ),
          ),

          // Next Button
          Positioned(
            bottom: 20,
            left: 300,
            child: ElevatedButton(
              onPressed: _nextGif,
              child: Text("Next"),
            ),
          ),
        ],
      ),
    );
  }
}
