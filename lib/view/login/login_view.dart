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
    with SingleTickerProviderStateMixin {
  AnimationController? aniController;

  @override
  void initState() {
    super.initState();

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
  void dispose() {
    super.dispose();
    aniController?.dispose();
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
                child: Hero(
                  tag: 'open_box',
                  child: Image.asset(Assets.imageGift),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double shake(double value) =>
      2 * (0.5 - (0.5 - Curves.bounceIn.transform(value)).abs());
}
