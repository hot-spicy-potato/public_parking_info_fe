import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/data/models/parking_info.dart';
import 'package:public_parking_info_fe/data/models/response/favorite_list_response.dart';
import 'package:public_parking_info_fe/providers/api_provider.dart';
import 'package:public_parking_info_fe/resources/resources.dart';
import 'package:public_parking_info_fe/services/map_service.dart';
import 'package:public_parking_info_fe/services/map_service_impl.dart';
import 'package:public_parking_info_fe/services/user_service.dart';
import 'package:public_parking_info_fe/services/user_service_impl.dart';

class FavoriteList extends ConsumerWidget {
  const FavoriteList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapService mapService = MapServiceImpl.instance;
    final UserService userService = UserServiceImpl.instance;

    Widget _emptyList() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Column(
          children: [
            Image.asset(Images.emptyDataIcon, width: 28),
            SizedBox(height: 6),
            Text(
              "즐겨찾는 주차장이 없습니다.",
              style: CustomFonts.w400(fontSize: 16, color: CustomColors.grey),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Text(
          "즐겨찾기",
          style: CustomFonts.w600(fontSize: 18, color: CustomColors.darkGrey),
        ),
        FutureBuilder(
          future: userService.getKakaoId(),
          builder: (context, snapshot) {
            final kakaoId = snapshot.data;
            if (kakaoId == null) return _emptyList();

            return ref
                .watch(favoriteListProvider(kakaoId))
                .when(
                  data: (data) {
                    if (data == null || data.isEmpty) {
                      return _emptyList();
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        FavoriteListItem favoriteItem = data[index];

                        ParkingInfo? parkingInfo = mapService
                            .getParkingInfoByMngNo(favoriteItem.code);

                        if (parkingInfo == null) return _emptyList();

                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      parkingInfo.parkingNm,
                                      style: CustomFonts.w600(
                                        fontSize: 18,
                                        color: CustomColors.darkGrey,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      parkingInfo.roadAddr.isEmpty
                                          ? parkingInfo.jibunAddr
                                          : parkingInfo.roadAddr,
                                      style: CustomFonts.w400(
                                        fontSize: 12,
                                        color: CustomColors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                Image.asset(Images.selectedStarIcon, width: 24),
                              ],
                            ),
                            Divider(color: CustomColors.divider, height: 40),
                          ],
                        );
                      },
                    );
                  },
                  error: (error, stackTrace) {
                    return Container();
                  },
                  loading: () {
                    return Container();
                  },
                );
          },
        ),
      ],
    );
  }
}
