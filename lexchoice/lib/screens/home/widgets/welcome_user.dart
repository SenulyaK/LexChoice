import 'dart:async'; // Add this import for Timer
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeUser extends StatefulWidget {
  WelcomeUser({Key? key}) : super(key: key);

  @override
  _WelcomeUserState createState() => _WelcomeUserState();
}

class _WelcomeUserState extends State<WelcomeUser> {
  final upcomings = [
    "assets/animations/welcome_user.gif",
    "assets/animations/coming_soon.gif",
  ];
  final _pageController = PageController();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Start the timer to auto-slide every 5 seconds
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.page == upcomings.length - 1) {
        _pageController.animateToPage(0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      } else {
        _pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      height: 120,
      child: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: upcomings.asMap().entries.map((entry) {
              int index = entry.key;
              String imagePath = entry.value;

              return Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.black,
                          Colors.black45,
                          Colors.black12,
                          Colors.black.withOpacity(0),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 20,
                    child: Text(
                      index == 0
                          ? "Welcome User"
                          : "New Stories\nComing Soon...",
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 55,
                    child: Text(
                      index == 0 ? "Learn, Play, and Make Smart Choices!" : "",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
          Positioned(
            left: 30,
            bottom: 10,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: upcomings.length,
              effect: const ExpandingDotsEffect(
                expansionFactor: 4,
                dotHeight: 8,
                dotWidth: 8,
                spacing: 4,
                activeDotColor: Colors.white,
                dotColor: Colors.white54,
              ),
              onDotClicked: (index) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
