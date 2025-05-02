import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/resources/resources.dart';

class SplashFirst extends ConsumerWidget {
  const SplashFirst({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height = MediaQuery.sizeOf(context).height;

    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: height * 0.2),
              SizedBox(
                height: 300,
                child: Image.asset(Images.logoIcon, width: 160),
              ),
              Text(
                "공영주차장알리미",
                style: CustomFonts.w700(
                  fontSize: 24,
                  color: CustomColors.darkGrey,
                ),
              ),
              SizedBox(height: 30),
              Text(
                "이제 주차 고민 끝!",
                style: CustomFonts.w700(
                  fontSize: 18,
                  color: CustomColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "시간을 절약하고, 주차 스트레스 없이\n편리하게 주차하세요!",
                style: CustomFonts.w400(
                  fontSize: 18,
                  color: CustomColors.darkGrey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
