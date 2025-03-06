import 'package:flutter/material.dart';
import 'package:lexchoice/screens/feedback_screen/detailed_feedback_screen.dart';
// Import the detailed feedback screen

class FeedbackSelectionScreen extends StatelessWidget {
  const FeedbackSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of available stories (dummy data for now)
    final List<String> stories = [
      "Lila’s Choice",
      "Aarya’s Decision",
      "Ravi’s Future",
      "Dillion’s Traffic Trouble",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.blue, width: 2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "FEEDBACKS",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              // Story selection buttons
              ...stories.map((story) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const FeedbackScreen(), // Navigate to feedback screen
                          ),
                        );
                      },
                      child: Text(
                        story,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
                onPressed: () {},
                child: const Text("See more"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
