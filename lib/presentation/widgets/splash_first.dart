import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/resources/resources.dart';

class SplashFirst extends ConsumerWidget {
  const SplashFirst({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset(Images.logoIcon, width: 160),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "공영주차장알리미",
                style: CustomFonts.w600(
                  fontSize: 24,
                  color: CustomColors.darkGrey,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "이제 주차 고민 끝!\n시간을 절약하고,\n더 이상 주차 스트레스 없이\n편리하게 주차하세요!",
                style: CustomFonts.w400(fontSize: 18, color: CustomColors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
