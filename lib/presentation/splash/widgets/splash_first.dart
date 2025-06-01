import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/resources/resources.dart';

class SplashFirst extends ConsumerWidget {
  const SplashFirst({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.sizeOf(context);

    return SizedBox(
      height: size.height * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Images.logoIcon, height: size.height * 0.12),
          Padding(
            padding: const EdgeInsets.only(top: 60, bottom: 20),
            child: Text(
              "공영주차장알리미",
              style: CustomFonts.w700(fontSize: 24, color: CustomColors.darkGrey),
            ),
          ),
          Text(
            "이제 주차 고민 끝!",
            style: CustomFonts.w700(fontSize: 18, color: CustomColors.primary),
            textAlign: TextAlign.center,
          ),
          Text(
            "시간을 절약하고, 주차 스트레스 없이\n편리하게 주차하세요!",
            style: CustomFonts.w400(fontSize: 18, color: CustomColors.darkGrey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
