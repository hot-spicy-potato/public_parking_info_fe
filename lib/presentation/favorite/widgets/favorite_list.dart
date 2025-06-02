import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/core/constants/ui/text_styles.dart';
import 'package:public_parking_info_fe/core/utils/screen_util.dart';
import 'package:public_parking_info_fe/data/models/response/favorite_list_response.dart';
import 'package:public_parking_info_fe/presentation/common_widgets/opacity_button.dart';
import 'package:public_parking_info_fe/presentation/favorite/providers/favorite_api_provider.dart';
import 'package:public_parking_info_fe/presentation/map/providers/map_provider.dart';
import 'package:public_parking_info_fe/resources/resources.dart';
import 'package:public_parking_info_fe/services/map_service.dart';

class FavoriteList extends ConsumerWidget {
  final String token;
  const FavoriteList({required this.token, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapService mapService = MapService.instance;
    final mapController = ref.watch(mapControllerProvider);

    return Column(
      children: [
        Text("즐겨찾기", style: TextStyles.style(fontSize: 18, fontWeight: 6)),
        FutureBuilder(
          future: ref.read(favoriteApiProvider.notifier).getFavoriteList(),
          builder: (context, snapshot) {
            if (snapshot.data != null && snapshot.data!.isNotEmpty) {
              return SizedBox(
                height: screenHeight(context) * 0.4,
                child: ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    final List<FavoriteListItem> list = snapshot.data ?? [];
                    final item = list[index];
                    final parkingInfo = mapService.getParkingInfoByCode(item.code);

                    if (parkingInfo == null) return _EmptyList();

                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OpacityButton(
                              onTap: () {
                                final lat = parkingInfo.lat;
                                final lon = parkingInfo.lon;

                                if (mapController != null) {
                                  mapService.setMapCenter(
                                    mapController: mapController,
                                    lat: lat,
                                    lon: lon,
                                  );
                                }
                              },
                              child: Column(
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
                                    style: CustomFonts.w400(fontSize: 12, color: CustomColors.grey),
                                  ),
                                ],
                              ),
                            ),
                            OpacityButton(
                              onTap: () async {
                                await ref
                                    .read(favoriteApiProvider.notifier)
                                    .setFavorite(code: item.code);
                                ref.invalidate(favoriteApiProvider);
                              },
                              child: Image.asset(Images.selectedStarIcon, width: 24),
                            ),
                          ],
                        ),
                        Divider(color: CustomColors.divider, height: 40),
                      ],
                    );
                  },
                ),
              );
            } else {
              return _EmptyList();
            }
          },
        ),
      ],
    );
  }
}

class _EmptyList extends ConsumerWidget {
  const _EmptyList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: screenHeight(context) * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Images.emptyDataIcon, width: 28),
          SizedBox(height: 8),
          Text("즐겨찾는 주차장이 없습니다.", style: TextStyles.style(fontSize: 14, fontWeight: 4)),
        ],
      ),
    );
  }
}
