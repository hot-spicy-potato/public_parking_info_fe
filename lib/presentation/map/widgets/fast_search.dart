import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/core/constants/ui/text_styles.dart';
import 'package:public_parking_info_fe/data/models/parking_info.dart';
import 'package:public_parking_info_fe/presentation/common_widgets/custom_bottom_sheet.dart';
import 'package:public_parking_info_fe/presentation/common_widgets/opacity_button.dart';
import 'package:public_parking_info_fe/presentation/map/widgets/nearby_parking_list.dart';
import 'package:public_parking_info_fe/presentation/map/providers/map_provider.dart';
import 'package:public_parking_info_fe/resources/resources.dart';
import 'package:public_parking_info_fe/services/map_service.dart';

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
    final MapService mapService = MapService.instance;

    return OpacityButton(
      onTap: () async {
        if (mapController != null) {
          final center = await mapController.getCenter();

          // getParkingNearby 메서드 호출 후, ParkingInfoWithDistance 객체를 반환받음
          final parkingList = mapService.getParkingNearby(
            lat: center.latitude,
            lon: center.longitude,
            radiusMeters: 1000,
          );

          showCustomBottomSheet(
            context,
            barrierColor: Colors.transparent,
            child: NearbyParkingList(parkingList: parkingList, mapController: mapController),
          );
        }
      },
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Images.carIcon, width: 15),
          SizedBox(width: 8),
          Text("빠른 탐색", style: TextStyles.style(fontSize: 16, fontWeight: 5, color: Colors.white)),
        ],
      ),
    );
  }
}
