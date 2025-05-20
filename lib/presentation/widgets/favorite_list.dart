import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/data/models/response/favorite_list_response.dart';
import 'package:public_parking_info_fe/providers/favorite_api_provider.dart';
import 'package:public_parking_info_fe/providers/map_provider.dart';
import 'package:public_parking_info_fe/resources/resources.dart';
import 'package:public_parking_info_fe/services/map_service.dart';
import 'package:public_parking_info_fe/services/user_service.dart';

class FavoriteList extends ConsumerWidget {
  const FavoriteList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapService mapService = MapService.instance;
    final UserService userService = UserService.instance;
    final mapController = ref.watch(mapControllerProvider);

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
        Text("즐겨찾기", style: CustomFonts.w600(fontSize: 18, color: CustomColors.darkGrey)),
        FutureBuilder(
          future: userService.getAccessToken().then((token) async {
            if (token == null) return null;
            final data = await ref.read(favoriteApiProvider.notifier).getFavoriteList();
            return {'token': token, 'favorites': data};
          }),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data == null) {
              return _emptyList();
            }

            final dataMap = snapshot.data!;
            final favorites = dataMap['favorites'] as List<FavoriteListItem>;

            if (favorites.isEmpty) {
              return _emptyList();
            }

            return ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(0),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final favoriteItem = favorites[index];
                final parkingInfo = mapService.getParkingInfoByCode(favoriteItem.code);

                if (parkingInfo == null) return _emptyList();

                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        final lat = parkingInfo.lat;
                        final lon = parkingInfo.lon;

                        if (mapController != null) {
                          mapService.setMapCenter(mapController: mapController, lat: lat, lon: lon);
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                parkingInfo.parkingNm,
                                style: CustomFonts.w600(fontSize: 18, color: CustomColors.darkGrey),
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
                          Image.asset(Images.selectedStarIcon, width: 24),
                        ],
                      ),
                    ),
                    Divider(color: CustomColors.divider, height: 40),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}
