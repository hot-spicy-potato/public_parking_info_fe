import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:public_parking_info_fe/presentation/widgets/custom_bottom_button.dart';
import 'package:public_parking_info_fe/presentation/widgets/custom_menu_button.dart';
import 'package:public_parking_info_fe/services/map_service.dart';
import 'package:public_parking_info_fe/services/map_service_impl.dart';
import 'package:sidebarx/sidebarx.dart';

class ParkingMapPage extends ConsumerStatefulWidget {
  const ParkingMapPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ParkingMapPageState();
}

class _ParkingMapPageState extends ConsumerState<ParkingMapPage> {
  @override
  Widget build(BuildContext context) {
    final sideBarController = SidebarXController(selectedIndex: 0);
    final key = GlobalKey<ScaffoldState>();
    KakaoMapController? mapController;

    final MapService mapService = MapServiceImpl();

    return Scaffold(
      key: key,
      drawer: SidebarX(controller: sideBarController),
      body: Stack(
        children: [
          KakaoMap(
            onMapCreated: (controller) async {
              mapController = controller;

              // 지도 이동
              final currentLocation = await mapService.getCurrentLocation();
              final currentPosition = LatLng(
                currentLocation.latitude,
                currentLocation.longitude,
              );

              if (mapController != null) {
                mapController!.setLevel(6);
                await mapController!.setCenter(currentPosition);
                await mapService.addMarkersInView(mapController!);
              }
            },
            onCameraIdle:
                (latLng, zoomLevel) async =>
                    await mapService.addMarkersInView(mapController!),
          ),
          CustomMenuButton(sideBarKey: key),
          Positioned(right: 20, bottom: 30, child: CustomBottomButton()),
        ],
      ),
    );
  }
}
