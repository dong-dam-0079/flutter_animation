import 'package:ForQA/res/assets.dart';

class InfoModel {
  String title, caption, img;

  InfoModel(
    this.title,
    this.caption,
    this.img,
  );
}

List<InfoModel> generateSomeData() {
  List<String> titleList = [
    "London",
    "Düsseldorf",
    "Lucerne",
    "Malé",
  ];

  List<String> captionList = [
    "United Kingdom",
    "Germany",
    "Switzerland",
    "Maldives",
  ];

  List<String> assetName = [
    Assets.imageDummy,
    Assets.imageDummy,
    Assets.imageDummy,
    Assets.imageDummy,
  ];

  List<InfoModel> list = List.generate(
    4,
    (index) => InfoModel(
      titleList[index],
      captionList[index],
      assetName[index],
    ),
  );
  return list;
}
