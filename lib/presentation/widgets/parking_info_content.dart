import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/data/models/parking_info.dart';
import 'package:public_parking_info_fe/providers/map_provider.dart';
import 'package:public_parking_info_fe/services/map_service.dart';
import 'package:public_parking_info_fe/services/map_service_impl.dart';

class ParkingInfoContent extends ConsumerWidget {
  const ParkingInfoContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ParkingInfo? parkingInfo = ref.watch(targetParkingProvider);

    return parkingInfo != null
        ? Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                      style: CustomFonts.w400(
                        fontSize: 18,
                        color: CustomColors.darkGrey,
                      ),
                    ),
                    // 도로명주소
                    Text(
                      parkingInfo.roadAddr,
                      style: CustomFonts.w400(
                        fontSize: 12,
                        color: CustomColors.grey,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.star, color: CustomColors.grey),
              ],
            ),
            Column(
              children: [
                // 주차요금
                _info("주차요금", parkingInfo.parkingFee),
                // 운영시간
                _info("운영시간", parkingInfo.operGb),
                // 주차면수
                _info("주차면수", parkingInfo.parkingCnt.toString()),
              ],
            ),
            Text(
              "${parkingInfo.lastUpdateDt} 업데이트",
              style: CustomFonts.w400(fontSize: 18, color: CustomColors.grey),
            ),
          ],
        )
        : Text("정보가 없습니다.");
  }

  Widget _info(String key, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            key,
            style: CustomFonts.w400(fontSize: 16, color: CustomColors.darkGrey),
          ),
          Text(
            value,
            style: CustomFonts.w600(fontSize: 16, color: CustomColors.darkGrey),
          ),
        ],
      ),
    );
  }
}
