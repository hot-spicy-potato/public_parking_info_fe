import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/resources/resources.dart';

class SplashSecond extends ConsumerWidget {
  const SplashSecond({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.sizeOf(context);

    return SizedBox(
      height: size.height * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Images.splash03Icon, height: size.height * 0.12),
          Padding(
            padding: const EdgeInsets.only(top: 60, bottom: 20),
            child: Text(
              "위치 서비스를 활성화하세요!",
              style: CustomFonts.w700(fontSize: 24, color: CustomColors.primary),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            "그리고 더 많은 편리한 기능을\n경험해보세요.",
            style: CustomFonts.w400(fontSize: 18, color: CustomColors.darkGrey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
