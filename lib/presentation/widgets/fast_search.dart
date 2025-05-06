import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/data/models/parking_info.dart';
import 'package:public_parking_info_fe/presentation/widgets/custom_bottom_sheet.dart';
import 'package:public_parking_info_fe/presentation/widgets/nearby_parking_list.dart';
import 'package:public_parking_info_fe/providers/map_provider.dart';
import 'package:public_parking_info_fe/resources/resources.dart';
import 'package:public_parking_info_fe/services/map_service.dart';
import 'package:public_parking_info_fe/services/map_service_impl.dart';

class ParkingInfoWithDistance {
  final ParkingInfo parkingInfo; // ParkingInfo 객체
  final double distance; // 거리

  // 생성자
  ParkingInfoWithDistance({required this.parkingInfo, required this.distance});
}

class FastSearch extends ConsumerWidget {
  const FastSearch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = ref.watch(mapControllerProvider);
    final MapService mapService = MapServiceImpl.instance;

    return GestureDetector(
      onTap: () async {
        if (mapController != null) {
          final center = await mapController.getCenter();

          // getParkingNearby 메서드 호출 후, ParkingInfoWithDistance 객체를 반환받음
          final parkingList = mapService.getParkingNearby(
            lat: center.latitude,
            lon: center.longitude,
            radiusMeters: 1000,
          );

          // 거리 정보를 포함한 주차 목록을 바텀 시트로 보여줌
          showCustomBottomSheet(
            context,
            barrierColor: Colors.transparent,
            child: NearbyParkingList(parkingList: parkingList),
          );
        }
      },
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        decoration: BoxDecoration(
          color: Color(0x99000000),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Images.carIcon, width: 15),
            SizedBox(width: 8),
            Text(
              "빠른 탐색",
              style: CustomFonts.w500(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
