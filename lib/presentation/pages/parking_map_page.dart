import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:public_parking_info_fe/services/get_current_location.dart';

class ParkingMapPage extends ConsumerStatefulWidget {
  const ParkingMapPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ParkingMapPageState();
}

class _ParkingMapPageState extends ConsumerState<ParkingMapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KakaoMap(
        onMapCreated: (controller) async {
          final currentLocation = await getCurrentLocation();
          final currentPosition = LatLng(
            currentLocation.latitude,
            currentLocation.longitude,
          );

          // TODO: 위치 권한 거부될 경우 초기 위치 설정 필요

          await controller.setCenter(currentPosition);
        },
      ),
    );
  }
}
