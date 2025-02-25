import 'package:flutter/material.dart';
import 'package:lexchoice/models/story.dart';

class DetailPage extends StatelessWidget {
  final Story story;
  const DetailPage(this.story, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: Center(
        child: Text("Detail Page"),
      ),
    );
  }
}

AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: const Icon(
        Icons.arrow_back_ios_outlined,
        color: Colors.black,
      ), // Icon
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.more_horiz_outlined,
          color: Colors.black,
        ), // Icon
      ), // IconButton
    ],
  ); // AppBar
}
