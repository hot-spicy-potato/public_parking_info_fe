import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/presentation/widgets/review_rate.dart';
import 'package:public_parking_info_fe/resources/resources.dart';

class ReviewListItem extends ConsumerWidget {
  const ReviewListItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget menuItem(Function onTap, String text, double bottomMargin) {
      return GestureDetector(
        onTap: () => onTap(),
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: bottomMargin, left: 30, right: 30),
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            text,
            style: CustomFonts.w600(fontSize: 16, color: CustomColors.primary),
          ),
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "고길동",
                    style: CustomFonts.w700(
                      fontSize: 18,
                      color: CustomColors.darkGrey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        barrierColor: Colors.black45,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return BottomSheet(
                            backgroundColor: Colors.transparent,
                            onClosing: () {},
                            builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  menuItem(() {}, "신고하기", 6),
                                  menuItem(() => context.pop(), "취소", 40),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Image.asset(Images.dotMenuIcon, width: 22),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  ReviewRate(value: 4, size: 14, paddingRight: 4),
                  SizedBox(width: 8),
                  Text(
                    "2025.05.03",
                    style: CustomFonts.w400(
                      fontSize: 16,
                      color: CustomColors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                "리뷰 내용입니다.",
                style: CustomFonts.w400(fontSize: 16, color: CustomColors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
