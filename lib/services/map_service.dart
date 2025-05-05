import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:public_parking_info_fe/data/models/parking_info.dart';

abstract class MapService {
  Future<Position?> getCurrentLocation();
  Future<Position> setInitialLocation();
  Future<List<ParkingInfo>> loadParkingData();
  Future<void> addMarkersInView(KakaoMapController mapController);
  Future<LatLng?> searchAddress(String keyword);
  void setMapCenter({
    required KakaoMapController mapController,
    required double lat,
    required double lon,
    int? level,
  });
  Future<void> updateMarker({
    required KakaoMapController mapController,
    required String markerId,
    required LatLng latLng,
    required WidgetRef ref,
  });
  ParkingInfo? getParkingInfo(LatLng latLng);
  List<ParkingInfo> getParkingNearby({
    required double lat,
    required double lon,
    required int radiusMeters,
  });
}
