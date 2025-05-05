import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/data/models/parking_info.dart';
import 'package:public_parking_info_fe/data/models/request/review_request.dart';
import 'package:public_parking_info_fe/data/models/response/review_info_response.dart';
import 'package:public_parking_info_fe/data/models/response/review_list_response.dart';
import 'package:public_parking_info_fe/presentation/widgets/custom_bottom_sheet.dart';
import 'package:public_parking_info_fe/presentation/widgets/request_login_sheet.dart';
import 'package:public_parking_info_fe/presentation/widgets/review_dropdown.dart';
import 'package:public_parking_info_fe/presentation/widgets/review_list_item.dart';
import 'package:public_parking_info_fe/presentation/widgets/review_rate.dart';
import 'package:public_parking_info_fe/providers/api_provider.dart';
import 'package:public_parking_info_fe/resources/resources.dart';
import 'package:public_parking_info_fe/services/user_service.dart';
import 'package:public_parking_info_fe/services/user_service_impl.dart';

class ReviewPage extends ConsumerWidget {
  final ParkingInfo parkingInfo;
  final ReviewInfoResponse reviewInfo;
  const ReviewPage({
    required this.parkingInfo,
    required this.reviewInfo,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserService userService = UserServiceImpl.instance;
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
              GestureDetector(
                onTap: () async {
                  final token = await userService.getToken();
                  if (token == null) {
                    showCustomBottomSheet(
                      context,
                      barrierColor: Colors.black.withOpacity(0.4),
                      child: RequestLoginSheet(),
                    );
                  } else {
                    context.pushNamed("writeReview");
                  }
                },
                child: ReviewRate(value: 0, size: 24, paddingRight: 4),
              ),
              Divider(color: CustomColors.divider, thickness: 6, height: 80),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // 통계
                    Row(
                      children: [
                        Text(
                          reviewInfo.score.toString(),
                          style: CustomFonts.w600(
                            fontSize: 20,
                            color: CustomColors.primary,
                          ),
                        ),
                        SizedBox(width: 6),
                        ReviewRate(value: 3, size: 16, paddingRight: 2),
                        Spacer(),
                        Text(
                          "후기 ${reviewInfo.total.toString()}",
                          style: CustomFonts.w400(
                            fontSize: 16,
                            color: CustomColors.grey,
                          ),
                        ),
                      ],
                    ),
                    // 필터
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: ReviewDropdown(),
                    // ),
                  ],
                ),
              ),
              Consumer(
                builder: (context, ref, child) {
                  return ref
                      .watch(
                        reviewListProvider(
                          ReviewRequest(
                            mngCd: parkingInfo.mngNo.toString(),
                            sort: "",
                          ),
                        ),
                      )
                      .when(
                        data: (data) {
                          existReview = data?.favoriteList.isNotEmpty ?? false;
                          return _widget(existReview, data);
                        },
                        error:
                            (error, stackTrace) => _widget(existReview, null),
                        loading: () => _widget(existReview, null),
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _widget(bool existReview, ReviewListResponse? data) {
    final existReview = data != null && data.favoriteList.isNotEmpty;

    return Column(
      children: [
        // 리뷰
        existReview
            ? ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: data.favoriteList.length,
              itemBuilder:
                  (context, index) =>
                      ReviewListItem(reviewItem: data.favoriteList[index]),
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
    );
  }
}
