import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../common/common_text_styles.dart';
import '../../res/assets.dart';
import '../../res/colors.dart';
import '../../res/dimens.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  final ItemScrollController scrollController = ItemScrollController();

  AnimationController? _btnDownCtrl;
  AnimationController? _backgroundCtrl;
  Animation<Color?>? bgrColorTheme;

  bool isChangeBackground = true;
  int length = 3;

  @override
  void initState() {
    super.initState();
    controlAnimation();
  }

  void controlAnimation() {
    _btnDownCtrl = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    )
      ..forward()
      ..addListener(() {
        if (_btnDownCtrl!.isCompleted) {
          _btnDownCtrl?.repeat();
        }
      });

    _backgroundCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    bgrColorTheme = ColorTween(
      begin: ColorsRes.backgroundTheme,
      end: ColorsRes.backgroundTheme2,
    ).animate(_backgroundCtrl!)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void deactivate() {
    super.deactivate();
    _btnDownCtrl?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _backgroundCtrl!,
      builder: (context, child) => Scaffold(
        backgroundColor: bgrColorTheme?.value,
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
          itemCount: length,
          itemBuilder: (context, index) {
            return Container(
              height: index == length - 1
                  ? MediaQuery.of(context).size.height * 0.86
                  : MediaQuery.of(context).size.height * 0.85 - kToolbarHeight,
              padding: const EdgeInsets.only(
                top: DimensRes.sp24,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText(
                              'Xin chào $index',
                              textStyle: CommonTextStyles.medium,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: index != length - 1,
                    child: AnimatedBuilder(
                      animation: _btnDownCtrl!,
                      builder: (context, child) => Transform.translate(
                        offset: Offset(0, 15 * shake(_btnDownCtrl!.value)),
                        child: SizedBox(
                          height: DimensRes.sp80,
                          width: DimensRes.sp80,
                          child: IconButton(
                            color: ColorsRes.transparent,
                            highlightColor: ColorsRes.transparent,
                            onPressed: () => _onClickNext(index),
                            icon: SvgPicture.asset(
                              Assets.icArrowDown,
                              color: ColorsRes.palePink,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  double shake(double value) =>
      2 * (0.5 - (0.5 - Curves.easeIn.transform(value)).abs());

  void _onClickNext(int index) {
    if (isChangeBackground) {
      _backgroundCtrl?.forward();
    } else {
      _backgroundCtrl?.reverse();
    }
    isChangeBackground = !isChangeBackground;
    scrollController.scrollTo(
      index: index + 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }
}
