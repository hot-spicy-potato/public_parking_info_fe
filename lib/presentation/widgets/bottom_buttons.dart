import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/presentation/widgets/custom_bottom_button.dart';
import 'package:public_parking_info_fe/presentation/widgets/custom_dialog.dart';
import 'package:public_parking_info_fe/presentation/widgets/fast_search.dart';
import 'package:public_parking_info_fe/resources/resources.dart';

class BottomButtons extends ConsumerWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.sizeOf(context).width;

    Widget iconTextButton({
      required Function onTap,
      required String src,
      required String text,
      required Color textColor,
      required Color buttonColor,
    }) {
      return GestureDetector(
        onTap: () => onTap(),
        child: Container(
          width: 48,
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: buttonColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                spreadRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(src, width: 16, height: 16),
              SizedBox(height: 4),
              Text(
                text,
                style: CustomFonts.w500(fontSize: 9, color: textColor),
              ),
            ],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Stack(
        children: [
          SizedBox(
            width: width,
            height: 102,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FastSearch(),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                iconTextButton(
                  src: Images.roadViewIcon,
                  text: "로드뷰",
                  textColor: CustomColors.grey,
                  buttonColor: Colors.white,
                  onTap: () {},
                ),
                SizedBox(height: 6),
                iconTextButton(
                  src: Images.currentLocationIcon,
                  text: "내 위치",
                  textColor: Colors.white,
                  buttonColor: CustomColors.primary,
                  onTap: () => currentLocationEvent(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void currentLocationEvent(context) {
    showCustomDialog(
      context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 60,
            alignment: Alignment.centerLeft,
            child: Text(
              "현재 위치를 찾을 수 없습니다.",
              style: CustomFonts.w600(
                fontSize: 20,
                color: CustomColors.darkGrey,
              ),
            ),
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(height: 2.4),
              children: [
                TextSpan(
                  text: "[설정 -> 공영주차장 알리미]",
                  style: CustomFonts.w700(
                    fontSize: 16,
                    color: CustomColors.primary,
                  ),
                ),
                TextSpan(
                  text: "에서 위치서비스를 허용하시면 현재 위치의 주차장 정보를 보실 수 있습니다.",
                  style: CustomFonts.w400(
                    fontSize: 16,
                    color: CustomColors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: CustomBottomButton(
                  color: CustomColors.whiteGrey,
                  text: "건너뛰기",
                  fontColor: CustomColors.grey,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: CustomBottomButton(
                  color: CustomColors.primary,
                  text: "설정하기",
                  fontColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
