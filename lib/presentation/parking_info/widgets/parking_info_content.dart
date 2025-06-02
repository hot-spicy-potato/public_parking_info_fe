import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/text_styles.dart';
import 'package:public_parking_info_fe/data/models/parking_info.dart';
import 'package:public_parking_info_fe/data/models/response/review_info_response.dart';
import 'package:public_parking_info_fe/presentation/common_widgets/opacity_button.dart';
import 'package:public_parking_info_fe/presentation/favorite/widgets/favorite_button.dart';
import 'package:public_parking_info_fe/presentation/review/widgets/review_rate.dart';
import 'package:public_parking_info_fe/presentation/review/providers/review_api_provider.dart';
import 'package:public_parking_info_fe/resources/resources.dart';

class ParkingInfoContent extends ConsumerWidget {
  final ParkingInfo parkingInfo;
  const ParkingInfoContent({required this.parkingInfo, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 주차장 이름
        Text(parkingInfo.parkingNm, style: TextStyles.style(fontSize: 18, fontWeight: 7)),
        // 도로명주소
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(
            parkingInfo.roadAddr.isEmpty ? parkingInfo.jibunAddr : parkingInfo.roadAddr,
            style: TextStyles.style(fontSize: 14, fontWeight: 4, color: CustomColors.grey),
          ),
        ),
        // 후기
        FutureBuilder<ReviewInfoResponse?>(
          future: ref
              .watch(reviewApiProvider.notifier)
              .getReviewInfo(code: parkingInfo.mngNo.toString()),
          builder: (context, snapshot) {
            final defaultReview = ReviewInfoResponse(code: "", total: 0, score: 0, favorite: false);

            final reviewInfo = snapshot.data ?? defaultReview;

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ReviewScore(
                  score: reviewInfo.score.toInt(),
                  parkingInfo: parkingInfo,
                  reviewInfo: reviewInfo,
                ),
                FavoriteButton(
                  mngNo: parkingInfo.mngNo.toString(),
                  favoriteState: reviewInfo.favorite ?? false,
                ),
              ],
            );
          },
        ),
        Divider(color: CustomColors.whiteGrey, thickness: 1, height: 40),
        Column(
          children: [
            // 주차요금
            _ParkingInfo(
              img: Images.parkingFeeIcon,
              text: "주차요금",
              infoText: parkingInfo.parkingFee,
            ),
            // 운영시간
            _ParkingInfo(img: Images.operationTimeIcon, text: "운영시간", infoText: parkingInfo.operGb),
            // 주차면수
            _ParkingInfo(
              img: Images.enableParkingCountIcon,
              text: "주차면수",
              infoText: parkingInfo.parkingCnt.toString(),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.updatedDateIcon, width: 15),
            SizedBox(width: 4),
            Text(
              "${parkingInfo.lastUpdateDt} 업데이트",
              style: TextStyles.style(fontSize: 14, fontWeight: 4, color: CustomColors.lightGrey),
            ),
          ],
        ),
      ],
    );
  }
}

class _ReviewScore extends ConsumerWidget {
  final int score;
  final ParkingInfo parkingInfo;
  final ReviewInfoResponse reviewInfo;
  const _ReviewScore({required this.score, required this.parkingInfo, required this.reviewInfo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OpacityButton(
      onTap: () {
        context.pushNamed("review", extra: {"parkingInfo": parkingInfo, "reviewInfo": reviewInfo});
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            score.toString(),
            style: TextStyles.style(fontSize: 16, fontWeight: 6, color: CustomColors.primary),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ReviewRate(value: score, size: 18, paddingRight: 4),
          ),
          Text(
            "후기",
            style: TextStyles.style(fontSize: 16, fontWeight: 4, color: CustomColors.grey),
          ),
          SizedBox(width: 6),
          Image.asset(Images.arrowRight, height: 12),
        ],
      ),
    );
  }
}

class _ParkingInfo extends ConsumerWidget {
  final String img;
  final String text;
  final String infoText;
  const _ParkingInfo({required this.img, required this.text, required this.infoText});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Image.asset(img, width: 20, height: 20),
          SizedBox(width: 6),
          Text(text, style: TextStyles.style(fontSize: 16, fontWeight: 4)),
          Spacer(),
          Text(
            infoText,
            style: TextStyles.style(fontSize: 17, fontWeight: 6, color: CustomColors.primary),
          ),
        ],
      ),
    );
  }
}
