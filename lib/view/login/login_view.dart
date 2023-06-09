import 'package:flutter/material.dart';
import 'package:flutter_animation/res/assets.dart';
import 'package:flutter_animation/res/colors.dart';
import 'package:flutter_animation/res/dimens.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      body: SafeArea(
        child: Center(
          child: AnimatedBuilder(
            animation: aniController!,
            builder: (context, child) => Transform.translate(
              offset: Offset(20 * shake(aniController!.value), 0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      Assets.icMailClose,
                      color: ColorsRes.secondary,
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: DimensRes.sp32,
                          width: DimensRes.sp32,
                          child: SvgPicture.asset(
                            Assets.icDot,
                            color: ColorsRes.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double shake(double value) =>
      2 * (0.5 - (0.5 - Curves.bounceOut.transform(value)).abs());
}
