import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/providers/map_provider.dart';
import 'package:public_parking_info_fe/resources/resources.dart';
import 'package:public_parking_info_fe/services/location_service.dart';

class CurrentLocationButton extends ConsumerWidget {
  const CurrentLocationButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = ref.watch(mapControllerProvider);
    final isLocation = ref.watch(locationViewProvider);
    final LocationService locationService = LocationService.instance;
    // Position? currentLocation;
    // LatLng? mapCenter;

    return GestureDetector(
      onTap: () async {
        ref.read(locationViewProvider.notifier).toggle();
        final isLocation = ref.watch(locationViewProvider);
        Position? currentLocation = await locationService.getCurrentLocation();
        if (currentLocation != null) {
          // 현재 위치 저장
          final latLng = LatLng(
            currentLocation.latitude,
            currentLocation.longitude,
          );
          ref.read(currentUserLocationProvider.notifier).state = latLng;
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
          color: isLocation ? const Color(0xFF613EEA) : Colors.white,
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
            Image.asset(
              Images.currentLocationIcon,
              width: 16,
              height: 16,
              color: isLocation ? Colors.white : Colors.grey,
            ),
            SizedBox(height: 4),
            Text(
              "내 위치",
              style: CustomFonts.w500(
                fontSize: 9,
                color: isLocation ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
