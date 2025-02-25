import 'package:flutter/material.dart';
import 'package:lexchoice/screens/home/widgets/custom_tab.dart';
import 'package:lexchoice/screens/home/widgets/story_staggered_gridview.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:lexchoice/utils/helpers/helper_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var tabIndex = 0;
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final darkMode = LCHelperFunctions.isDarkMode(context);
    return Scaffold(
        backgroundColor: darkMode
            ? const Color(0xFF191A48)
            : LCColors.light, // Custom theme color

        /// App Bar
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu_rounded,
                color: darkMode ? LCColors.white : LCColors.black,
              )),
          title: Image.asset(
            "assets/images/lexchoice_logo.png", // Ensure this file exists
            height: 90, // Increased logo size
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_rounded,
                color: darkMode ? LCColors.white : LCColors.black,
              ), // Icon
            ) // IconButton
          ],
        ),

        // Body
        body: Column(
          children: [
            CustomTab(
              tabIndex,
              (int index) {
                setState(() {
                  tabIndex = index;
                });
                pageController.jumpToPage(index); // Set State
              },
            ),
            Expanded(
                child: StoryStaggeredGridView(
              tabIndex,
              pageController,
              (int index) => setState(() {
                tabIndex = index;
              }),
            ))
// CustomTab
          ],
        )
        // Body
        );
  }
}
