import 'package:ForQA/res/gaps.dart';
import 'package:ForQA/view/widget/page_view.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../common/common_text_styles.dart';
import '../../res/assets.dart';
import '../../res/colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ItemScrollController scrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRes.backgroundTheme,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          '_02.05.2023_',
          style: CommonTextStyles.medium,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        flexibleSpace: SvgPicture.asset(
          Assets.bannerHeart,
          fit: BoxFit.cover,
        ),
      ),
      body: Column(
        children: [
          Gaps.vGap12,
          const Expanded(
            child: TransformPageViewWidget(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Center(
              child: DefaultTextStyle(
                style: CommonTextStyles.medium,
                child: AnimatedTextKit(
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    TyperAnimatedText(
                      'Hí em yêu\nHi vọng món quà này sẽ làm ngày sinh nhật của em thêm trọn vẹn nhé\n🎂\nFrom Sơn Đông with love',
                      textAlign: TextAlign.center,
                      speed: const Duration(milliseconds: 60),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
