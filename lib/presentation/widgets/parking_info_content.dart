import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';

class ParkingInfoContent extends ConsumerWidget {
  const ParkingInfoContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
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
                  "시흥중앙성결교회 민영 주차장",
                  style: CustomFonts.w400(
                    fontSize: 18,
                    color: CustomColors.darkGrey,
                  ),
                ),
                // 도로명주소
                Text(
                  "서울 금천구 시흥동 870",
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
            _info("주차요금", "정보없음"),
            // 운영시간
            _info("운영시간", "정보없음"),
            // 주차면수
            _info("주차면수", "8"),
          ],
        ),
        Text(
          "2024-04-28 업데이트",
          style: CustomFonts.w400(fontSize: 18, color: CustomColors.grey),
        ),
      ],
    );
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
