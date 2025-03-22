import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lexchoice/game/widgets/audio_manager.dart';
import 'package:lexchoice/game/widgets/timer_manager.dart';
import 'package:lexchoice/models/story.dart';
import 'package:lexchoice/utils/constants/colors.dart';
import 'package:lexchoice/utils/theme/custom_themes/glowing_button.dart';
import 'package:lexchoice/game/widgets/story_splash_screen.dart';
import 'package:audioplayers/audioplayers.dart';


class DetailPage extends StatelessWidget {
  final Story story;
  const DetailPage(this.story, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkMode = Theme.of(context).brightness == Brightness.dark;

    final AudioPlayer _audioPlayer = AudioPlayer();

    void _playPlaySound() {
      _audioPlayer.play(AssetSource('audio/play.mp3'));
    }


    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              darkMode ? LCColors.secondary : LCColors.light,
              darkMode ? LCColors.background : LCColors.white,
            ],
            begin: Alignment.center,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 550,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                    child: Image.asset(
                      story.imgUrl,
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.center,
                    ),
                  ),
                  Positioned(
                      top: 56,
                      left: 20,
                      child: GestureDetector(
                        onTap: () { 
                          Navigator.of(context).pop();},
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_outlined,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 250,
                    maxHeight: 100,
                  ),

                  /// Title
                  child: Text(
                    story.storyTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                      color: darkMode ? Colors.white : LCColors.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 5),

                /// Type
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    story.type,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: darkMode
                          ? const Color.fromARGB(131, 224, 224, 224)
                          : LCColors.darkerGrey,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                /// Law Name
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 300,
                    child: Text(
                      story.lawName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: darkMode
                            ? LCColors.primary
                            : const Color.fromARGB(255, 30, 107, 158),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                /// Description
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 370, // Set your desired width
                    child: Text(
                      story.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: darkMode ? LCColors.grey : LCColors.secondary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 17),

                /// Button
                GlowingButton(
                  onPressed: () {
                    HapticFeedback.heavyImpact;
                    _playPlaySound();
                    timerManager.startTimer();
                    audioManager.stopHomeMusic();
                    Future.delayed(Duration(seconds: 3), () {
                      audioManager.playBackgroundMusic();
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StorySplashScreen(
                          storyTitle: story.storyTitle,
                          splashGif:
                              'assets/images/splash/${story.storyTitle.toLowerCase().replaceAll(" ", "_")}.gif',
                          gameScreen: story.getGameScreen(),
                        ),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.black,
                    size: 28,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
