import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/data/models/parking_info.dart';
import 'package:public_parking_info_fe/presentation/widgets/review_dropdown.dart';
import 'package:public_parking_info_fe/presentation/widgets/review_list_item.dart';
import 'package:public_parking_info_fe/presentation/widgets/review_rate.dart';
import 'package:public_parking_info_fe/resources/resources.dart';

class ReviewPage extends ConsumerWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ParkingInfo parkingInfo = ParkingInfo(
      mngNo: 100,
      parkingNm: "시흥중앙성결교회 민영 주차장",
      x: 100,
      y: 100,
      gb: "100",
      type: "공영",
      jibunAddr: "",
      roadAddr: "",
      parkingCnt: 3,
      operGb: "",
      parkingFee: "",
      mngAgencyNm: "",
      areaGb: "",
      areaGbSub: "",
      lon: 30,
      lat: 30,
      addrCd: 30,
      telNo: "",
      lastUpdateDt: "",
    );

    bool existReview = false;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(
            Icons.arrow_back_ios,
            color: CustomColors.darkGrey,
            size: 15,
          ),
        ),
        title: Text(
          parkingInfo.parkingNm,
          style: CustomFonts.w700(fontSize: 18, color: CustomColors.darkGrey),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "방문 후기를 남겨주세요!",
                  style: CustomFonts.w700(
                    fontSize: 20,
                    color: CustomColors.primary,
                  ),
                ),
              ),
              ReviewRate(value: 0, size: 24, paddingRight: 4),
              Divider(color: CustomColors.divider, thickness: 6, height: 80),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // 통계
                    Row(
                      children: [
                        Text(
                          "3.0",
                          style: CustomFonts.w600(
                            fontSize: 20,
                            color: CustomColors.primary,
                          ),
                        ),
                        SizedBox(width: 6),
                        ReviewRate(value: 3, size: 16, paddingRight: 2),
                        Spacer(),
                        Text(
                          "후기 1",
                          style: CustomFonts.w400(
                            fontSize: 16,
                            color: CustomColors.grey,
                          ),
                        ),
                      ],
                    ),
                    // 필터
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ReviewDropdown(),
                    ),
                  ],
                ),
              ),
              // 리뷰
              !existReview
                  ? ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) => ReviewListItem(),
                  )
                  : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 80),
                      Image.asset(Images.noDataIcon, width: 18),
                      SizedBox(height: 4),
                      Text(
                        "등록된 리뷰가 없습니다.",
                        style: CustomFonts.w400(
                          fontSize: 16,
                          color: CustomColors.grey,
                        ),
                      ),
                    ],
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
