import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:public_parking_info_fe/presentation/pages/road_view_page.dart';
import 'package:public_parking_info_fe/presentation/widgets/bottom_bar.dart';
import 'package:public_parking_info_fe/presentation/widgets/custom_bottom_sheet.dart';
import 'package:public_parking_info_fe/presentation/widgets/parking_info_content.dart';
import 'package:public_parking_info_fe/presentation/widgets/search_field.dart';
import 'package:public_parking_info_fe/providers/map_provider.dart';
import 'package:public_parking_info_fe/services/map_service.dart';
import 'package:public_parking_info_fe/services/map_service_impl.dart';

class ParkingMapPage extends ConsumerStatefulWidget {
  const ParkingMapPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ParkingMapPageState();
}

class _ParkingMapPageState extends ConsumerState<ParkingMapPage> {
  @override
  Widget build(BuildContext context) {
    final mapController = ref.watch(mapControllerProvider);
    final MapService mapService = MapServiceImpl.instance;

    return Scaffold(
      body: Stack(
        children: [
          KakaoMap(
            // 지도 이동 및 마커 표시 초기 설정
            onMapCreated: (controller) async {
              ref.read(mapControllerProvider.notifier).state = controller;

              final currentLocation = await mapService.setInitialLocation();

              mapService.setMapCenter(
                mapController: controller,
                lat: currentLocation.latitude,
                lon: currentLocation.longitude,
              );

              await mapService.addMarkersInView(controller);
            },
            // 지도 이동시 마커 로드
            onCameraIdle: (latLng, zoomLevel) async {
              if (mapController != null) {
                await mapService.addMarkersInView(mapController);
              }
            },
            // 마커 클릭시 바텀 시트 노출
            onMarkerTap: (markerId, latLng, zoomLevel) async {
              await mapService.updateMarker(
                mapController: mapController!,
                markerId: markerId,
                latLng: latLng,
                ref: ref,
              );

              showCustomBottomSheet(
                context,
                barrierColor: Colors.transparent,
                child: ParkingInfoContent(),
              );
            },
            onMapTap: (latLng) async {
              final isRoadView = ref.watch(roadViewProvider);

              print(isRoadView);

              if (isRoadView) {
                context.pushNamed("roadView", extra: latLng);
              }
            },
          ),
          // 검색필드
          SearchField(),
          Align(alignment: Alignment.bottomCenter, child: BottomBar()),
        ],
      ),
    );
  }
}
