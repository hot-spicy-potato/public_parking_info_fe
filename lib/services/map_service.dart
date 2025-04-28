import 'package:geolocator/geolocator.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:public_parking_info_fe/data/models/parking_info.dart';

abstract class MapService {
  Future<Position> getCurrentLocation();
  Future<List<ParkingInfo>> loadParkingData();
  Future<void> addMarkersInView(KakaoMapController mapController);
  Future<LatLng?> searchAddress(String keyword);
  void setMapCenter({
    required KakaoMapController mapController,
    required double lat,
    required double lon,
    int? level,
  });
}
