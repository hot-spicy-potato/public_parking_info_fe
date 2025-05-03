import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/data/models/parking_info.dart';
import 'package:public_parking_info_fe/presentation/widgets/review_rate.dart';
import 'package:public_parking_info_fe/providers/map_provider.dart';
import 'package:public_parking_info_fe/resources/resources.dart';

class ParkingInfoContent extends ConsumerWidget {
  const ParkingInfoContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ParkingInfo? parkingInfo = ref.watch(targetParkingProvider);

    return parkingInfo != null
        ? Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 주차장 이름
                    Text(
                      parkingInfo.parkingNm,
                      style: CustomFonts.w700(
                        fontSize: 18,
                        color: CustomColors.darkGrey,
                      ),
                    ),
                    SizedBox(height: 4),
                    // 도로명주소
                    Text(
                      parkingInfo.roadAddr.isEmpty
                          ? parkingInfo.jibunAddr
                          : parkingInfo.roadAddr,
                      style: CustomFonts.w400(
                        fontSize: 12,
                        color: CustomColors.grey,
                      ),
                    ),
                    SizedBox(height: 4),
                  ],
                ),
                // 즐겨찾기 여부
                Image.asset(Images.starIcon, width: 24),
              ],
            ),
            // 후기
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "3.0",
                  style: CustomFonts.w600(
                    fontSize: 16,
                    color: CustomColors.primary,
                  ),
                ),
                SizedBox(width: 6),
                ReviewRate(value: 3, size: 18, paddingRight: 6),
                Text(
                  "후기",
                  style: CustomFonts.w400(
                    fontSize: 16,
                    color: CustomColors.grey,
                  ),
                ),
                SizedBox(width: 6),
                Image.asset(Images.arrowRight, height: 14),
              ],
            ),
            Divider(color: CustomColors.whiteGrey, thickness: 1, height: 40),
            Column(
              children: [
                // 주차요금
                _info(Images.parkingFeeIcon, "주차요금", parkingInfo.parkingFee),
                // 운영시간
                _info(Images.operationTimeIcon, "운영시간", parkingInfo.operGb),
                // 주차면수
                _info(
                  Images.enableParkingCountIcon,
                  "주차면수",
                  parkingInfo.parkingCnt.toString(),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Images.updatedDateIcon, width: 15),
                SizedBox(width: 4),
                Text(
                  "${parkingInfo.lastUpdateDt} 업데이트",
                  style: CustomFonts.w400(
                    fontSize: 12,
                    color: CustomColors.lightGrey,
                  ),
                ),
              ],
            ),
          ],
        )
        : Text("정보가 없습니다.");
  }

  Widget _info(String iconSrc, String key, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Image.asset(iconSrc, width: 24, height: 24),
          SizedBox(width: 4),
          Text(
            key,
            style: CustomFonts.w400(fontSize: 16, color: CustomColors.darkGrey),
          ),
          Spacer(),
          Text(
            value,
            style: CustomFonts.w600(fontSize: 18, color: CustomColors.primary),
          ),
        ],
      ),
    );
  }
}
