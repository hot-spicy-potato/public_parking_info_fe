import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/data/models/response/review_list_response.dart';
import 'package:public_parking_info_fe/presentation/widgets/review_rate.dart';
import 'package:public_parking_info_fe/providers/review_api_provider.dart';
import 'package:public_parking_info_fe/resources/resources.dart';
import 'package:intl/intl.dart';

class ReviewListItem extends ConsumerWidget {
  final ReviewListItemResponse reviewItem;
  const ReviewListItem({required this.reviewItem, super.key});

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
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Text(text, style: CustomFonts.w600(fontSize: 16, color: CustomColors.primary)),
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(color: CustomColors.divider),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    reviewItem.name,
                    style: CustomFonts.w700(fontSize: 18, color: CustomColors.darkGrey),
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
                                  reviewItem.myReview
                                      ? menuItem(
                                        () {
                                          ref
                                              .read(reviewApiProvider.notifier)
                                              .deleteReview(id: reviewItem.id);
                                          ref.invalidate(reviewApiProvider);
                                          context.pop();
                                        },
                                        "삭제하기",
                                        6,
                                      )
                                      : menuItem(
                                        () {
                                          ref
                                              .read(reviewApiProvider.notifier)
                                              .reportReview(id: reviewItem.id);
                                          ref.invalidate(reviewApiProvider);
                                          context.pop();
                                        },
                                        "신고하기",
                                        6,
                                      ),
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
                  ReviewRate(value: reviewItem.score.toInt(), size: 14, paddingRight: 4),
                  SizedBox(width: 8),
                  Text(
                    DateFormat("yyyy.mm.dd").format(reviewItem.reviewDate),
                    style: CustomFonts.w400(fontSize: 16, color: CustomColors.grey),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                reviewItem.content,
                style: CustomFonts.w400(fontSize: 16, color: CustomColors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
