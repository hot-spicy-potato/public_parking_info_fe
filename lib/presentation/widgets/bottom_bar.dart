import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/presentation/widgets/current_location_button.dart';
import 'package:public_parking_info_fe/presentation/widgets/custom_bottom_sheet.dart';
import 'package:public_parking_info_fe/presentation/widgets/fast_search.dart';
import 'package:public_parking_info_fe/presentation/widgets/favorite_list.dart';
import 'package:public_parking_info_fe/presentation/widgets/request_login_sheet.dart';
import 'package:public_parking_info_fe/presentation/widgets/road_view_button.dart';
import 'package:public_parking_info_fe/providers/page_provider.dart';
import 'package:public_parking_info_fe/resources/resources.dart';
import 'package:public_parking_info_fe/services/user_service.dart';

class BottomBar extends ConsumerWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.sizeOf(context).width;
    final UserService userService = UserService.instance;

    Widget iconWithText({
      required int index,
      required String src,
      required String selectedSrc,
      required String text,
      required Function onTap,
    }) {
      final isSelected = ref.watch(pageProvider) == index;

      return GestureDetector(
        onTap: () {
          onTap();
        },
        child: Column(
          children: [
            Image.asset(isSelected ? selectedSrc : src, width: 24, height: 24),
            SizedBox(height: 4),
            Text(
              text,
              style: CustomFonts.w400(
                fontSize: 12,
                color: isSelected ? CustomColors.primary : CustomColors.unselected,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FastSearch(),
            SizedBox(width: width / 3 - 48),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [RoadViewButton(), SizedBox(height: 6), CurrentLocationButton()],
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, spreadRadius: 2)],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconWithText(
                    index: 0,
                    src: Images.tabbarHomeIcon,
                    selectedSrc: Images.selectedTabbarHomeIcon,
                    text: "홈",
                    onTap: () {
                      ref.read(pageProvider.notifier).state = 0;
                    },
                  ),
                  iconWithText(
                    index: 1,
                    src: Images.tabbarFavoriteIcon,
                    selectedSrc: Images.selectedTabbarFavoriteIcon,
                    text: "즐겨찾기",
                    onTap: () async {
                      final token = await userService.getAccessToken();
                      if (token == null) {
                        showCustomBottomSheet(
                          context,
                          barrierColor: Colors.black.withOpacity(0.4),
                          child: RequestLoginSheet(),
                        );
                      } else {
                        ref.read(pageProvider.notifier).state = 1;
                        showCustomBottomSheet(
                          context,
                          barrierColor: Colors.black.withOpacity(0.4),
                          child: FavoriteList(),
                        ).then((value) => ref.read(pageProvider.notifier).state = 0);
                      }
                    },
                  ),
                  // iconWithText(
                  //   index: 2,
                  //   src: Images.tabbarHistoryIcon,
                  //   selectedSrc: Images.selectedTabbarHistoryIcon,
                  //   text: "주차이력",
                  //   onTap: () {
                  //     //
                  //   },
                  // ),
                  // iconWithText(
                  //   index: 3,
                  //   src: Images.tabbarMypageIcon,
                  //   selectedSrc: Images.selectedTabbarMypageIcon,
                  //   text: "내 정보",
                  //   onTap: () {
                  //     showCustomBottomSheet(
                  //       context,
                  //       barrierColor: Colors.black.withOpacity(0.4),
                  //       child: RequestLoginSheet(),
                  //     );
                  //   },
                  // ),
                ],
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }
}
