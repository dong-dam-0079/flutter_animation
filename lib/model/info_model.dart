import 'package:ForQA/res/assets.dart';

class InfoModel {
  String title, caption, img;
  bool? isShowVideo;

  InfoModel(
    this.title,
    this.caption,
    this.img, {
    this.isShowVideo,
  });
}

List<InfoModel> generateSomeData() {
  List<String> titleList = ["Hí", "Yêu", "Em", "1327", "Finally"];

  List<String> captionList = [
    "Hí em yêu\n Đây là 'món quà cây nhà lá vườn anh' làm để chúc mừng sinh nhật cục yêu của anh\nVậy nên em hãy xem từng ảnh một nhé",
    "Chúc em yêu của anh có một ngày sinh nhật thật vui vẻ dù ở bên gia đình hay ở bên cạnh anh nhé",
    "Cô gái của anh mãi mãi là đoá hoa đẹp nhất trong lòng anh nhé\n🌹",
    "Yêu em\n1 Đời\n3 Ca ( sáng - chiều - tối )\n2 Mùa ( mùa mưa và khô )\nVà 7 Ngày trong tuần",
    "Chúc em và chúc cho đôi ta già cùng nhau là được\n❤❤❤"
  ];

  List<String> assetName = [
    Assets.imgGreen,
    Assets.imgBlue1,
    Assets.imgNation,
    Assets.imgSapa,
    Assets.imgEnd,
  ];

  List<InfoModel> list = List.generate(
    titleList.length,
    (index) => InfoModel(
      titleList[index],
      captionList[index],
      assetName[index],
      isShowVideo: index == titleList.length - 1 ? true : false,
    ),
  );
  return list;
}
