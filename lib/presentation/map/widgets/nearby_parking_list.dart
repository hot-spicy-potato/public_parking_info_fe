import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/text_styles.dart';
import 'package:public_parking_info_fe/presentation/map/widgets/fast_search.dart';
import 'package:public_parking_info_fe/services/map_service.dart';

class NearbyParkingList extends ConsumerWidget {
  final List<ParkingInfoWithDistance> parkingList;
  final KakaoMapController mapController;

  const NearbyParkingList({required this.parkingList, required this.mapController, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height = MediaQuery.sizeOf(context).height;
    final MapService mapService = MapService.instance;

    return SizedBox(
      height: height * 0.4, // ListView 높이 제한
      child: ListView.separated(
        itemCount: parkingList.length,
        itemBuilder: (context, index) {
          final item = parkingList[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 0),
            title: Text(
              item.parkingInfo.parkingNm,
              style: TextStyles.style(fontSize: 16, fontWeight: 6),
            ),
            subtitle: Text(
              item.parkingInfo.roadAddr.isNotEmpty == true
                  ? item.parkingInfo.roadAddr
                  : item.parkingInfo.jibunAddr,
              style: TextStyles.style(fontSize: 14, fontWeight: 4, color: CustomColors.darkGrey2),
            ),
            trailing: Text(
              "${(item.distance / 1000).toStringAsFixed(1)} km",
              style: TextStyles.style(fontSize: 14, fontWeight: 5, color: CustomColors.darkGrey2),
            ),
            onTap: () {
              final lat = item.parkingInfo.lat;
              final lon = item.parkingInfo.lon;

              mapService.setMapCenter(mapController: mapController, lat: lat, lon: lon);
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(height: 16),
      ),
    );
  }
}
