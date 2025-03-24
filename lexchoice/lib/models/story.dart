import 'package:lexchoice/utils/constants/image_strings.dart';
import 'package:lexchoice/game/game_lila.dart';
import 'package:lexchoice/game/game_ravi.dart';
import 'package:lexchoice/game/game_amy.dart';
import 'package:lexchoice/game/game_devin.dart';
import 'package:lexchoice/game/game_aarya.dart';

class Story {
  String storyTitle;
  String type;
  String description;
  String lawName;
  String imgUrl;
  double height;
  int gameID;

  Story(this.storyTitle, this.type, this.description, this.lawName, this.imgUrl,
      this.height, this.gameID);

  

  dynamic getGameScreen() {
    switch (storyTitle) {
      case "Lila's Choice":
        return LilaGameScreen();
      case "Ravi's Future":
        return RaviGameScreen();
      case "Aarya's Decisions":
        return AaryaGameScreen();
      case "Amy's Cyber Rules":
        return AmyGameScreen();
      case "Devin's Traffic Trouble":
        return DevinGameScreen();
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
          "Lila was an 11-year-old girl who loved going school. One day, a stranger approached her, showing her how important it is to stay safe and speak up...",

          /// Law Name
          "The Children and Young Persons Ordinance (CYPO) (1939)",

          /// Image
          LCImages.lila,

          /// Height
          280,
          
          1),
      Story(

          /// Title
          "Ravi's Future",

          /// Type
          "Child rights and Child labor",

          /// Description
          "Ravi was a 12-year-old boy who loved school and playing football. He dreamed of being a teacher, but one day, something tough happened that changed his life...",

          /// Law Name
          "The Employment of Women, Young Persons, and Children Act (1956)",

          /// Image
          LCImages.ravi,

          /// Height
          260,
          
          3),
      Story(

          /// Title
          "Aarya's Decisions",

          /// Type
          "Theft and Robbery",

          /// Description
          "Aarya was a 10-year-old boy who loved going to the market with his mom. He got a bicycle as a birthday present and loved riding it wherever he went. But one day ...",

          /// Law Name
          "Penal Code of Sri Lanka, No. 2 of 1883",

          /// Image
          LCImages.aarya,

          /// Height
          280,
          
          2),
      Story(

          /// Title
          "Amy's Cyber Rules",

          /// Type
          "Cyber Crimes",

          /// Description
          "Amy was a 13-year-old girl who loved playing online games and chatting with friends. One day, she met a mysterious person online, which taught her how to stay safe on the internet...",

          /// Law Name
          "Computer Crimes Act, No. 24 of 2007",

          /// Image
          LCImages.amy,

          /// Height
          290,
          
          5),
      Story(

          /// Title
          "Devin's Traffic Trouble",

          /// Type
          "Road Safety",

          /// Description
          "Devin was a cheerful boy who rode his bicycle to and from school. One day while going home, an incident on road taught him the importance of road rules...",

          /// Law Name
          "Motor Traffic Act (No. 14 of 1951)",

          /// Image
          LCImages.devin,

          /// Height
          250,
          
          4),
    ];
  }
}
