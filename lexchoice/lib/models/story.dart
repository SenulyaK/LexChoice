import 'package:lexchoice/utils/constants/image_strings.dart';
import 'package:lexchoice/game/game_lila.dart';
import 'package:lexchoice/game/game_ravi.dart';

class Story {
  String storyTitle;
  String type;
  String description;
  String lawName;
  String imgUrl;
  double height;

  Story(this.storyTitle, this.type, this.description, this.lawName, this.imgUrl,
      this.height);

  dynamic getGameScreen() {
    switch (storyTitle) {
      case "Lila's Choice":
        return LilaGameScreen();
      case "Ravi's Future":
        return RaviGameScreen();
      case "Aarya's Decisions":
        print("error: unknown story title");
        ;
      case "Amy’s Cyber Rules":
        print("error: unknown story title");
        ;
      default:
        print("error: unknown story title");
    }
  }

  static List<Story> generateStories() {
    return [
      Story(

          /// Title
          "Lila's Choice",

          /// Type
          "Child abuse",

          /// Description
          "Lila was an 11-year-old girl who loved playing outside and helping her mom. One day, something happened that showed her how important it is to speak up and stay safe...",

          /// Law Name
          "The Children and Young Persons Ordinance (CYPO) (1939)",

          /// Image
          LCImages.lila,

          /// Height
          280),
      Story(

          /// Title
          "Ravi's Future",

          /// Type
          "Child rights and Child labor",

          /// Description
          "Ravi was a 12-year-old boy who loved school and playing cricket. He dreamed of being a teacher, but one day, something tough happened that changed his life...",

          /// Law Name
          "The Employment of Women, Young Persons, and Children Act (1956)",

          /// Image
          LCImages.ravi,

          /// Height
          250),
      Story(

          /// Title
          "Aarya's Decisions",

          /// Type
          "Child offences",

          /// Description
          "Aarya was a 13-year-old boy who loved cricket and hanging out with friends. One day, he made a mistake that taught him a big lesson about right and wrong...",

          /// Law Name
          "The Children and Young Persons Ordinance (CYPO) (1939)",

          /// Image
          LCImages.aarya,

          /// Height
          260),
      Story(

          /// Title
          "Amy’s Cyber Rules",

          /// Type
          "Cyber crimes",

          /// Description
          "Amy was a 13-year-old girl who loved playing online games and chatting with friends. One day, she met a mysterious person online, which taught her how to stay safe on the internet...",

          /// Law Name
          "Computer Crimes Act, No. 24 of 2007",

          /// Image
          LCImages.amy,

          /// Height
          290),
    ];
  }
}
