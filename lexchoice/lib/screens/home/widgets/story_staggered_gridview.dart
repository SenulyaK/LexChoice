import 'package:flutter/material.dart';
import 'package:lexchoice/models/story.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lexchoice/screens/home/widgets/story_item.dart';

class StoryStaggeredGridView extends StatelessWidget {
  final int selected;
  final PageController pageController;
  final Function callback;

  StoryStaggeredGridView(this.selected, this.pageController, this.callback,
      {Key? key})
      : super(key: key);

  final storyList = Story.generateStories();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: PageView(
        controller: pageController,
        onPageChanged: (index) => callback(index),
        children: [
          SingleChildScrollView(
            child: MasonryGridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Adjust for responsiveness
              ),
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              itemCount: storyList.length,
              itemBuilder: (context, index) => StoryItem(storyList[index]),
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
