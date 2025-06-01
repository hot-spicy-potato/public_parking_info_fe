import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/text_styles.dart';
import 'package:public_parking_info_fe/core/utils/screen_util.dart';
import 'package:public_parking_info_fe/resources/resources.dart';

class SplashSecond extends ConsumerWidget {
  const SplashSecond({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: screenHeight(context) * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Images.splash03Icon, height: screenHeight(context) * 0.12),
          Padding(
            padding: const EdgeInsets.only(top: 60, bottom: 20),
            child: Text(
              "위치 서비스를 활성화하세요!",
              style: TextStyles.style(fontSize: 24, fontWeight: 7, color: CustomColors.primary),
            ),
          ),
          Text(
            "그리고 더 많은 편리한 기능을\n경험해보세요.",
            style: TextStyles.style(fontSize: 18, fontWeight: 4),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
