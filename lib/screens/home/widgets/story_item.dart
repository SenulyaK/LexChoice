import 'package:flutter/material.dart';
import 'package:lexchoice/models/story.dart';
import 'package:lexchoice/screens/detail/detail.dart';

class StoryItem extends StatelessWidget {
  final Story story;
  const StoryItem(this.story, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => DetailPage(story))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to left
        children: [
          // Image Container
          Container(
            height: story.height.toDouble(), // Ensure it's a double
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(story.imgUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(height: 8), // Spacing between image and text
          // Title Text
          //
        ],
      ),
    );
  }
}
