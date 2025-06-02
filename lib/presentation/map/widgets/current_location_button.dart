import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/text_styles.dart';
import 'package:public_parking_info_fe/presentation/common_widgets/opacity_button.dart';
import 'package:public_parking_info_fe/presentation/map/providers/map_provider.dart';
import 'package:public_parking_info_fe/resources/resources.dart';
import 'package:public_parking_info_fe/services/location_service.dart';

class CurrentLocationButton extends ConsumerWidget {
  const CurrentLocationButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = ref.watch(mapControllerProvider);
    final LocationService locationService = LocationService.instance;

    return OpacityButton(
      onTap: () async {
        Position? currentLocation = await locationService.getCurrentLocation();
        if (currentLocation != null) {
          mapController?.setCenter(LatLng(currentLocation.latitude, currentLocation.longitude));
        }
      },
      size: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: CustomColors.primary,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, spreadRadius: 2, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Images.currentLocationIcon, width: 16),
          SizedBox(height: 4),
          Text("내 위치", style: TextStyles.style(fontSize: 9, fontWeight: 5, color: Colors.white)),
        ],
      ),
    );
  }
}
