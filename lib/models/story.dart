import 'package:lexchoice/utils/constants/image_strings.dart';

class Story {
  String storyTitle;
  String type;
  String description;
  String lawName;
  String imgUrl;
  double height;

  Story(this.storyTitle, this.type, this.description, this.lawName, this.imgUrl,
      this.height);

  static List<Story> generateStories() {
    return [
      Story(

          /// Title
          "Lila's Choice",

          /// Type
          "Child abuse",

          /// Description
          "Lila was a cheerful 11-year-old who loved her small village. She enjoyed playing outside after school and helping her mother at home. One day, something happened that taught her the importance of speaking up and staying safe.",

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
          "Ravi was a bright 12-year-old boy who loved going to school and playing cricket with his friends. He dreamed of becoming a teacher one day. However, one day, his life took a difficult turn.",

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
          "Aarya was a 13-year-old boy who loved playing cricket with his friends after school. He was usually cheerful and kind, but one day, he made a mistake that taught him a big lesson about right and wrong.",

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
          "Amy was a 13-year-old girl who loved playing online games and chatting with her friends on social media. One day she comes across a mysterious friend online that taught her the importance of being safe online",

          /// Law Name
          "Computer Crimes Act, No. 24 of 2007",

          /// Image
          LCImages.amy,

          /// Height
          290),
    ];
  }
}
