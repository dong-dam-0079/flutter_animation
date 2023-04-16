import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/res/assets.dart';
import 'package:flutter_animation/res/colors.dart';
import 'package:flutter_animation/view/home/home_view.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  AnimationController? aniController;
  final audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    // _playSound();

    aniController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )
      ..forward()
      ..addListener(() {
        if (aniController!.isCompleted) {
          aniController?.repeat();
        }
      });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
        audioPlayer.setReleaseMode(ReleaseMode.loop);
        break;
      case AppLifecycleState.inactive:
        audioPlayer.setReleaseMode(ReleaseMode.stop);
        break;
      case AppLifecycleState.paused:
        audioPlayer.setReleaseMode(ReleaseMode.stop);
        break;
      default:
        break;
    }
  }

  @override
  void dispose() {
    super.dispose();
    aniController?.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRes.backgroundTheme,
      body: Center(
        child: AnimatedBuilder(
          animation: aniController!,
          builder: (context, child) => Transform.translate(
            offset: Offset(0, 20 * shake(aniController!.value)),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: InkWell(
                splashColor: ColorsRes.transparent,
                highlightColor: ColorsRes.transparent,
                onTap: () {
                  Get.to(const HomeView());
                },
                child: Image.asset(Assets.imageGift),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double shake(double value) =>
      2 * (0.5 - (0.5 - Curves.bounceIn.transform(value)).abs());

  void _playSound() async {
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    await audioPlayer.play(AssetSource(Assets.soundCute));
  }
}
