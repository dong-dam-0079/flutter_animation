import 'package:ForQA/common/common_text_styles.dart';
import 'package:ForQA/model/info_model.dart';
import 'package:ForQA/res/assets.dart';
import 'package:ForQA/res/colors.dart';
import 'package:ForQA/res/dimens.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class DetailView extends StatefulWidget {
  const DetailView({
    Key? key,
    required this.info,
  }) : super(key: key);

  final InfoModel info;

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(Assets.video)
      ..initialize().then((value) {
        setState(() {
          _controller?.play();
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var content = widget.info.caption;
    var isShowVideo = widget.info.isShowVideo;

    if (isShowVideo == false) {
      _controller?.pause();
    }

    return Scaffold(
      backgroundColor: ColorsRes.backgroundTheme,
      body: Hero(
        tag: widget.info.caption,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.info.img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: DimensRes.sp40,
              left: DimensRes.sp10,
              child: Material(
                color: ColorsRes.transparent,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: SvgPicture.asset(
                    Assets.icArrowBack,
                    width: DimensRes.sp20,
                    height: DimensRes.sp20,
                  ),
                ),
              ),
            ),
            Positioned(
              top: DimensRes.sp100,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: DimensRes.sp12),
                  child: DefaultTextStyle(
                    style: CommonTextStyles.mediumBold
                        .copyWith(color: ColorsRes.palePink),
                    child: AnimatedTextKit(
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        TyperAnimatedText(
                          content,
                          textAlign: TextAlign.center,
                          speed: const Duration(
                            milliseconds: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: DimensRes.sp50,
              child: Visibility(
                visible: isShowVideo ?? false,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: DimensRes.sp12),
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(DimensRes.sp12),
                          border: Border.all(color: ColorsRes.black),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.8),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 3),
                            )
                          ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(DimensRes.sp12),
                        child: VideoPlayer(_controller!),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
