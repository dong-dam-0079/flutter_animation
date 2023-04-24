import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

import '../res/colors.dart';
import '../res/dimens.dart';

final Shader linearGradient = const LinearGradient(
  colors: <Color>[ColorsRes.orange, ColorsRes.paleOrange],
).createShader(const Rect.fromLTWH(0.5, 0.5, 200.0, 80.0));

class CommonTextStyles {
  static final medium = GoogleFonts.meowScript(
    fontSize: DimensRes.sp36,
    fontWeight: FontWeight.w500,
    foreground: Paint()..shader = linearGradient,
  );

  static final mediumWhite = GoogleFonts.meowScript(
    fontSize: DimensRes.sp36,
    color: ColorsRes.white,
    fontWeight: FontWeight.w700,
  );

  static final largeBold = GoogleFonts.meowScript(
    fontSize: DimensRes.sp40,
    fontWeight: FontWeight.w700,
    foreground: Paint()..shader = linearGradient,
  );
}
