import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';

import '../res/colors.dart';
import '../res/dimens.dart';

class CommonTextStyles {
  static final medium = GoogleFonts.meowScript(
    fontSize: DimensRes.sp36,
    color: ColorsRes.black,
    fontWeight: FontWeight.w500,
  );

  static final mediumBold = GoogleFonts.meowScript(
    fontSize: DimensRes.sp44,
    color: ColorsRes.black,
    fontWeight: FontWeight.w700,
  );
}
