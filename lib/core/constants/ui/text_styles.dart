import 'package:flutter/rendering.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';

class TextStyles {
  static TextStyle style({
    required double fontSize,
    required int fontWeight,
    Color color = CustomColors.darkGrey,
    double? letterSpacing = -0.2,
    double? height = 0,
  }) {
    FontWeight getFontWeight() {
      switch (fontWeight) {
        case 1:
          return FontWeight.w100;
        case 2:
          return FontWeight.w200;
        case 3:
          return FontWeight.w300;
        case 4:
          return FontWeight.w400;
        case 5:
          return FontWeight.w500;
        case 6:
          return FontWeight.w600;
        case 7:
          return FontWeight.w700;
        case 8:
          return FontWeight.w800;
        case 9:
          return FontWeight.w900;
        default:
          return FontWeight.w400;
      }
    }

    return TextStyle(
      fontFamily: "Pretendard",
      fontSize: fontSize,
      fontWeight: getFontWeight(),
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }
}
