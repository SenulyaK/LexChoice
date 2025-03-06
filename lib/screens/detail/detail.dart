import 'package:flutter/material.dart';
import 'package:lexchoice/models/story.dart';
import 'package:lexchoice/utils/constants/colors.dart';

class DetailPage extends StatelessWidget {
  final Story story;
  const DetailPage(this.story, {super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              darkMode ? LCColors.secondary : LCColors.light,
              darkMode ? LCColors.background : LCColors.darkGrey,
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
                        onTap: () => Navigator.of(context).pop(),
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
                          : LCColors.secondary,
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
                        color: darkMode ? LCColors.primary : LCColors.secondary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                /// Description
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    story.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: darkMode ? LCColors.grey : LCColors.secondary,
                    ),
                  ),
                ),
                const SizedBox(height: 17),

                /// Button
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: LCColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: const EdgeInsets.all(12),
                  ),
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
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
