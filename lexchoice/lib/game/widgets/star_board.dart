import 'package:flutter/material.dart';
import 'package:lexchoice/game/widgets/score_manager.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:lexchoice/utils/theme/custom_themes/glowing_button.dart';

class StarBoard extends StatefulWidget {
  final int finalScore;

  const StarBoard({Key? key, required this.finalScore}) : super(key: key);

  @override
  _StarBoardState createState() => _StarBoardState();
}

class _StarBoardState extends State<StarBoard> with TickerProviderStateMixin {
  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true); // Rotate back and forth
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int stars = _calculateStars(widget.finalScore);

    // Get the current theme brightness (light or dark)
    Brightness brightness = Theme.of(context).brightness;

    return Scaffold(
      backgroundColor: brightness == Brightness.dark
          ? LCColors.secondary // Dark mode background
          : Colors.white, // Light mode background
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 75),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Story Completed GIF (Banner)
              Image.asset(
                'assets/images/story_completed.gif',
                width: 400, // Adjust size as needed
                height: 210,
                fit: BoxFit.cover,
              ),

              const SizedBox(height: 30),
              // Stars (Glowing animation)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  bool isMiddleStar = index == 1;
                  double size = isMiddleStar ? 95 : 70; // Middle star is larger

                  return Padding(
                    padding: EdgeInsets.only(top: isMiddleStar ? 0 : 30),
                    child: RotationTransition(
                      turns:
                          Tween<double>(begin: -0.05, end: 0.05) // Slight tilt
                              .animate(CurvedAnimation(
                        parent: _rotationController,
                        curve: Curves.easeInOut,
                      )),
                      child: Image.asset(
                        index < stars
                            ? 'assets/images/star_filled.png'
                            : 'assets/images/star_border.png',
                        width: size,
                        height: size,
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 20),

              // Score Label
              Text(
                "Your Score: ${widget.finalScore}",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: brightness == Brightness.dark
                      ? Colors.white // Dark mode text color
                      : Colors.black, // Light mode text color
                ),
              ),

              const SizedBox(height: 30),

              // ok Button
              GlowingButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  scoreManager.resetScore(); // Reset score when going back
                },
                child: const Icon(Icons.check_rounded,
                    color: Colors.black, size: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _calculateStars(int score) {
    if (score == 100) return 3;
    if (score >= 60) return 2;
    if (score >= 20) return 1;
    return 0;
  }
}
