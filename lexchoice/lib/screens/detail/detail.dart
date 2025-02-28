import 'package:flutter/material.dart';
import 'package:lexchoice/models/story.dart';
import 'package:lexchoice/utils/constants/colors.dart';

class DetailPage extends StatelessWidget {
  final Story story;
  const DetailPage(this.story, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LCColors.secondary,
      body: ListView(
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
                    // ignore: sort_child_properties_last
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
                    ),
                    top: 56,
                    left: 20),
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
                  style: const TextStyle(
                    fontSize: 24,
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                    color: LCColors.white,
                  ),
                ),
              ),

              const SizedBox(height: 5),

              /// Type
              Align(
                alignment: Alignment.center, // Centers the text horizontally
                child: Text(
                  story.type,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color.fromARGB(131, 224, 224, 224),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              /// Law Name
              Align(
                alignment: Alignment.center, // Centers the box
                child: SizedBox(
                  width: 300, // Adjust width as needed
                  child: Text(
                    story.lawName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: LCColors.primary,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              /// Description
              Align(
                alignment: Alignment.center, // Centers the text horizontally
                child: Text(
                  story.description,
                  textAlign:
                      TextAlign.center, // Ensures text content is centered
                  style: const TextStyle(
                    color: LCColors.grey,
                  ),
                ),
              ),

              const SizedBox(height: 17),

              /// Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: LCColors.primary, // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(50), // Makes it more circular
                  ),
                  padding: const EdgeInsets.all(
                      12), // Adjust padding for a better look
                ),
                child: const Icon(
                  Icons.play_arrow_rounded, // Play icon
                  color: Colors.white, // Icon color
                  size: 28, // Icon size
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
