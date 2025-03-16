import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'dart:math'; // To generate random number

class BackgroundAnimation extends StatefulWidget {
  const BackgroundAnimation({super.key});

  @override
  State<BackgroundAnimation> createState() => _BackgroundAnimationState();
}

class _BackgroundAnimationState extends State<BackgroundAnimation>
    with SingleTickerProviderStateMixin {
  // Define two colors you want for the particles
  final Color color1 = Colors.green; // First color
  final Color color2 = Colors.blue; // Second color

  // Function to get a random color (either color1 or color2)
  Color _getRandomColor() {
    return Random().nextBool() ? color1 : color2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(
          options: ParticleOptions(
            spawnMaxRadius: 100, // radius of background object
            spawnMinSpeed: 20, // minimum speed of object moving
            particleCount: 5, // number of objects in background
            spawnMaxSpeed: 40,
            spawnOpacity: 0.3, // maximum speed of object moving in background
            baseColor: _getRandomColor(), // Random color for each particle
          ),
        ),
        child: const Center(child: Text("")),
      ),
    );
  }
}
