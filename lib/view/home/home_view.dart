import 'package:flutter/material.dart';
import 'package:flutter_animation/common/common_text_styles.dart';
import 'package:flutter_animation/res/colors.dart';
import 'package:flutter_animation/res/dimens.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../res/assets.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  final ItemScrollController scrollController = ItemScrollController();

  AnimationController? _btnDownCtl;

  @override
  void initState() {
    super.initState();
    controlAnimation();
  }

  void controlAnimation() {
    _btnDownCtl = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    )
      ..forward()
      ..addListener(() {
        if (_btnDownCtl!.isCompleted) {
          _btnDownCtl?.repeat();
        }
      });
  }

  @override
  void deactivate() {
    super.deactivate();
    _btnDownCtl?.dispose();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRes.backgroundTheme,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        toolbarHeight: MediaQuery.of(context).size.height * 0.15,
        flexibleSpace: SvgPicture.asset(
          Assets.bannerHeart,
          fit: BoxFit.cover,
        ),
      ),
      body: ScrollablePositionedList.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemScrollController: scrollController,
        itemCount: 20,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text(
                'Data $index',
                style: CommonTextStyles.medium,
              ),
              AnimatedBuilder(
                animation: _btnDownCtl!,
                builder: (context, child) => Transform.translate(
                  offset: Offset(0, 20 * shake(_btnDownCtl!.value)),
                  child: SizedBox(
                    height: DimensRes.sp80,
                    width: DimensRes.sp80,
                    child: IconButton(
                      color: ColorsRes.transparent,
                      highlightColor: ColorsRes.backgroundTheme,
                      onPressed: () {
                        scrollController.scrollTo(
                            index: index + 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      icon: SvgPicture.asset(
                        Assets.icArrowDown,
                        color: ColorsRes.palePink,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  double shake(double value) =>
      2 * (0.5 - (0.5 - Curves.easeIn.transform(value)).abs());
}
