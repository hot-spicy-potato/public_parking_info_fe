import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/presentation/widgets/fast_search.dart';
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
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            title: Text(
              item.parkingInfo.parkingNm,
              style: CustomFonts.w600(fontSize: 16, color: Colors.black),
            ),
            subtitle: Text(
              item.parkingInfo.roadAddr.isNotEmpty == true
                  ? item.parkingInfo.roadAddr
                  : item.parkingInfo.jibunAddr,
              style: CustomFonts.w400(fontSize: 14, color: Colors.grey[700]!),
            ),
            trailing: Text(
              "${(item.distance / 1000).toStringAsFixed(1)} km",
              style: CustomFonts.w500(fontSize: 14, color: Colors.blueGrey),
            ),
            onTap: () {
              final lat = item.parkingInfo.lat;
              final lon = item.parkingInfo.lon;

              mapService.setMapCenter(mapController: mapController, lat: lat, lon: lon);
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(height: 1),
      ),
    );
  }
}
