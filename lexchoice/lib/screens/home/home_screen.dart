import 'package:flutter/material.dart';
import 'package:lexchoice/screens/home/widgets/custom_tab.dart';
import 'package:lexchoice/screens/home/widgets/story_staggered_gridview.dart';
import 'package:lexchoice/screens/home/widgets/welcome_user.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:lexchoice/utils/helpers/helper_functions.dart';
import 'package:lexchoice/utils/exit_dialog.dart';
import 'package:lexchoice/game/widgets/audio_manager.dart'; // Import audio manager

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AudioManager audioManager = AudioManager(); // Initialize AudioManager
  var tabIndex = 0;
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    audioManager.playHomeMusic(); // Start home screen music
  }

  @override
  void dispose() {
    audioManager.stopHomeMusic(); // Stop home music when leaving home screen
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = LCHelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: darkMode ? LCColors.secondary : LCColors.light,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => showExitDialog(context, darkMode),
          icon: Icon(
            Icons.exit_to_app,
            color: darkMode ? LCColors.white : LCColors.black,
          ),
        ),
        title: Image.asset(
          "assets/images/lexchoice_logo.png",
          height: 90,
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).brightness == Brightness.dark
                  ? LCColors.secondary
                  : Colors.white,
              Theme.of(context).brightness == Brightness.dark
                  ? LCColors.background
                  : LCColors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            WelcomeUser(),
            CustomTab(
              tabIndex,
              (int index) {
                setState(() {
                  tabIndex = index;
                });
                pageController.jumpToPage(index);
              },
            ),
            Expanded(
              child: StoryStaggeredGridView(
                tabIndex,
                pageController,
                (int index) => setState(() {
                  tabIndex = index;
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
