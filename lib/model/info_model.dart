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
    "Hôm nay là một ngày đặc biệt, là ngày mà cục yêu của anh đã có mặt trên thế giới cách đây vài chục năm về trước",
    "Chúc em yêu của anh có một ngày sinh nhật thật vui vẻ dù ở bên gia đình hay ở bên cạnh anh nhé",
    "Cô gái của anh mãi mãi là đoá hoa đẹp nhất trong lòng anh",
    "1327 là số ngày chúng mình yêu nhau cho đến hôm nay\nAnh nguyện yêu em\n1 Đời\n3 Ca ( sáng - chiều - tối )\n2 Mùa ( mùa mưa và khô )\nVà 7 Ngày trong tuần",
    "Và cuối cùng\nChúc em và chúc cho đôi ta già cùng nhau là được\n❤❤❤"
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
