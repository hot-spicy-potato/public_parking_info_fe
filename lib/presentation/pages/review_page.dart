import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/data/models/parking_info.dart';
import 'package:public_parking_info_fe/data/models/request/review_sort_request.dart';
import 'package:public_parking_info_fe/data/models/response/review_info_response.dart';
import 'package:public_parking_info_fe/presentation/widgets/custom_bottom_sheet.dart';
import 'package:public_parking_info_fe/presentation/widgets/request_login_sheet.dart';
import 'package:public_parking_info_fe/presentation/widgets/review_score.dart';
import 'package:public_parking_info_fe/presentation/widgets/review_sort_dropdown.dart';
import 'package:public_parking_info_fe/presentation/widgets/review_list_item.dart';
import 'package:public_parking_info_fe/presentation/widgets/review_rate.dart';
import 'package:public_parking_info_fe/providers/review_api_provider.dart';
import 'package:public_parking_info_fe/resources/resources.dart';
import 'package:public_parking_info_fe/services/user_service.dart';

class ReviewPage extends ConsumerWidget {
  final ParkingInfo parkingInfo;
  final ReviewInfoResponse reviewInfo;
  const ReviewPage({required this.parkingInfo, required this.reviewInfo, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserService userService = UserService.instance;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(Icons.arrow_back_ios, color: CustomColors.darkGrey, size: 15),
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
                  style: CustomFonts.w700(fontSize: 20, color: CustomColors.primary),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  final token = await userService.getAccessToken();
                  if (token == null) {
                    showCustomBottomSheet(
                      context,
                      barrierColor: Colors.black.withOpacity(0.4),
                      child: RequestLoginSheet(),
                    );
                  } else {
                    context.pushNamed("writeReview", extra: parkingInfo.mngNo.toString());
                  }
                },
                child: ReviewRate(value: 0, size: 24, paddingRight: 4),
              ),
              Divider(color: CustomColors.divider, thickness: 6, height: 80),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    ReviewScore(mngNo: parkingInfo.mngNo.toString()),
                    // 필터
                    Align(alignment: Alignment.centerLeft, child: ReviewSortDropdown()),
                  ],
                ),
              ),
              Consumer(
                builder: (context, ref, child) {
                  final request = ReviewSortRequest(
                    code: parkingInfo.mngNo.toString(),
                    sort: "score",
                  );

                  _empty() {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 80),
                        Image.asset(Images.noDataIcon, width: 18),
                        SizedBox(height: 4),
                        Text(
                          "등록된 리뷰가 없습니다.",
                          style: CustomFonts.w400(fontSize: 16, color: CustomColors.grey),
                        ),
                      ],
                    );
                  }

                  return ref
                      .watch(reviewListProvider(request))
                      .when(
                        data: (list) {
                          return list.isEmpty
                              ? _empty()
                              : ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: list.length,
                                itemBuilder:
                                    (context, index) => ReviewListItem(reviewItem: list[index]),
                              );
                        },
                        error: (error, stackTrace) => _empty(),
                        loading: () => CircularProgressIndicator(),
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
