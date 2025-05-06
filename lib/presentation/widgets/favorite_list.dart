import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/data/models/parking_info.dart';
import 'package:public_parking_info_fe/data/models/response/favorite_list_response.dart';
import 'package:public_parking_info_fe/data/models/response/favorite_response.dart';
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

    Widget _emptyList() {
      return Image.asset(Images.emptyDataIcon, width: 28);
    }

    return Column(
      children: [
        Text(
          "즐겨찾기",
          style: CustomFonts.w600(fontSize: 18, color: CustomColors.darkGrey),
        ),
        Consumer(
          builder: (context, ref, child) {
            final String kakaoId = ref.watch(kakaoIdProvider);

            return ref
                .watch(favoriteListProvider(kakaoId))
                .when(
                  data: (data) {
                    if (data == null || data.favoriteList.isEmpty) {
                      return _emptyList();
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.favoriteList.length,
                      itemBuilder: (context, index) {
                        FavoriteListItem favoriteItem =
                            data.favoriteList[index];

                        ParkingInfo? parkingInfo = mapService
                            .getParkingInfoByMngNo(favoriteItem.code);

                        if (parkingInfo == null) return _emptyList();

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
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
                                  parkingInfo.roadAddr,
                                  style: CustomFonts.w400(
                                    fontSize: 12,
                                    color: CustomColors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Image.asset(Images.selectedStarIcon, width: 24),
                          ],
                        );
                      },
                    );
                  },
                  error: (error, stackTrace) => Container(),
                  loading: () => Container(),
                );
          },
        ),
      ],
    );
  }
}
