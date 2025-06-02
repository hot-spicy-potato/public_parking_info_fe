import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/providers/map_provider.dart';
import 'package:public_parking_info_fe/resources/resources.dart';

// import 'package:public_parking_info_fe/services/map_service.dart';
// import 'package:public_parking_info_fe/services/map_service_impl.dart';

class SkyViewButton extends ConsumerWidget {
  const SkyViewButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final MapService mapService = MapServiceImpl.instance;
    final mapController = ref.watch(mapControllerProvider);
    final mapService = ref.read(mapServiceProvider);
    final isRoadView = ref.watch(roadViewProvider);

    return GestureDetector(
      onTap: () async {
        ref.read(roadViewProvider.notifier).toggle();
        final isRoadView = ref.watch(roadViewProvider);

        isRoadView
            ? mapController?.addOverlayMapTypeId(MapType.skyView)
            : mapController?.removeOverlayMapTypeId(MapType.skyView);

        // await mapController?.clearMarker();

        // final List<Marker> updatedMarkers =
        //     mapService.markerList.map((marker) {
        //       return Marker(
        //         markerId: marker.markerId,
        //         latLng: marker.latLng,
        //         width: marker.width,
        //         height: marker.height,
        //         markerImageSrc:
        //             isRoadView
        //                 ? 'https://velog.velcdn.com/images/luna-han/post/869cb99f-b485-49b0-8c7d-04d0ab0f9762/image.png'
        //                 : 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',
        //       );
        //     }).toList();

        // await mapController?.addMarker(markers: updatedMarkers);
      },
      child: Container(
        width: 48,
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              spreadRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.roadViewIcon, width: 16, height: 16),
            SizedBox(height: 4),
            Text(
              "로드뷰", // todo. 로드뷰
              style: CustomFonts.w500(fontSize: 9, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
