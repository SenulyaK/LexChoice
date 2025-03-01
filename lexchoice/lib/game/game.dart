import 'package:flutter/material.dart';
import 'package:lexchoice/models/story.dart';

class GameScreen extends StatefulWidget {
  final Story story;
  const GameScreen({Key? key, required this.story}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int currentSegment = 0;
  late List<String> segments;

  @override
  void initState() {
    super.initState();
    // For now, we create a dummy list of segments.
    // Later, you can load the actual video URLs and choice info from your story model.
    segments = [
      "Segment 1: Introduction",
      "Segment 2: Build-up",
      "Segment 3: Decision Point",
      "Segment 4: Outcome",
      "Segment 5: Conclusion"
    ];
  }

  void _nextSegment() {
    setState(() {
      if (currentSegment < segments.length - 1) {
        currentSegment++;
      } else {
        // End of story: You could show a summary or navigate back.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("End of story.")),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.story.storyTitle),
      ),
      body: Column(
        children: [
          // For now, this container simulates the video area.
          Expanded(
            child: Container(
              color: Colors.black12,
              child: Center(
                child: Text(
                  segments[currentSegment],
                  style: TextStyle(fontSize: 24, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          // "Next" button to move to the next segment.
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _nextSegment,
              child: Text("Next"),
            ),
          ),
        ],
      ),
    );
  }
}
