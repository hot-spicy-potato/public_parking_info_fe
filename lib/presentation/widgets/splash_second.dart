import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/resources/resources.dart';

class SplashSecond extends ConsumerWidget {
  const SplashSecond({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset(Images.splashMapIcon, width: 300),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            "위치 서비스를 활성화하시고,\n더 많은 편리한 기능을\n경험해 보세요.",
            style: CustomFonts.w600(fontSize: 24, color: CustomColors.darkGrey),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
