import 'package:flutter/material.dart';
import 'package:lexchoice/screens/home/widgets/custom_tab.dart';
import 'package:lexchoice/screens/home/widgets/story_staggered_gridview.dart';
import 'package:lexchoice/screens/home/widgets/welcome_user.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:lexchoice/utils/helpers/helper_functions.dart';
import 'package:lexchoice/utils/exit_dialog.dart';

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
            ? LCColors.secondary
            : LCColors.light, // Custom theme color

        /// App Bar
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () =>
                showExitDialog(context, darkMode), // Use the external function
            icon: Icon(
              Icons.exit_to_app,
              color: darkMode ? LCColors.white : LCColors.black,
            ),
          ),
          title: Image.asset(
            "assets/images/lexchoice_logo.png", // Ensure this file exists
            height: 90, // Increased logo size
          ),
          centerTitle: true,
        ),

        // Body
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // Check if the current theme is dark or light
                Theme.of(context).brightness == Brightness.dark
                    ? LCColors.secondary // Dark mode colors
                    : Colors.white, // Light mode colors
                Theme.of(context).brightness == Brightness.dark
                    ? LCColors.background // Dark mode colors
                    : LCColors.darkGrey, // Light mode colors
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),

          // Gradient
          child: Column(
            children: [
              WelcomeUser(),
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
          ),
        )
        // Body
        );
  }
}
