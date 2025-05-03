import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/providers/map_provider.dart';
import 'package:public_parking_info_fe/resources/resources.dart';
import 'package:public_parking_info_fe/services/map_service.dart';
import 'package:public_parking_info_fe/services/map_service_impl.dart';

class CurrentLocationButton extends ConsumerWidget {
  const CurrentLocationButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapService mapService = MapServiceImpl.instance;
    final mapController = ref.watch(mapControllerProvider);

    return GestureDetector(
      onTap: () async {
        Position? currentLocation = await mapService.getCurrentLocation();
        if (currentLocation != null) {
          mapController?.setCenter(
            LatLng(currentLocation.latitude, currentLocation.longitude),
          );
        }
      },
      child: Container(
        width: 48,
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: CustomColors.primary,
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
            Image.asset(Images.currentLocationIcon, width: 16, height: 16),
            SizedBox(height: 4),
            Text(
              "내 위치",
              style: CustomFonts.w500(fontSize: 9, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
