import 'package:geolocator/geolocator.dart';

class LocationService {
  LocationService._internal();
  static final LocationService _instance = LocationService._internal();
  static LocationService get instance => _instance;

  Future<Position?> getCurrentLocation() async {
    try {
      // 위치 서비스 사용 여부
      bool enableLocationService = await Geolocator.isLocationServiceEnabled();
      if (!enableLocationService) return null;

      // 위치 정보 제공 정보
      LocationPermission permission = await Geolocator.checkPermission();
      // 위치 정보 제공 여부
      bool isAgree = checkAgree(permission);

      if (!isAgree) {
        // 위치 정보 미제공시
        permission = await Geolocator.requestPermission();
        isAgree = checkAgree(permission);
      }

      if (isAgree) {
        // 위치 정보 제공시
        return await Geolocator.getCurrentPosition();
      }

      return null;
    } catch (e) {
      print("fail get current location : $e");
    }
    return null;
  }

  bool checkAgree(LocationPermission permission) {
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  // 초기 위치 지정: GPS 활성화시 현재 위치 / 미활성화시 서울역 반환
  Future<Position> setInitialLocation() async {
    return await getCurrentLocation() ?? getSeoulStationLocation();
  }

  // 서울역 좌표
  Position getSeoulStationLocation() {
    return Position(
      longitude: 37.5547,
      latitude: 126.9708,
      timestamp: DateTime.now(),
      accuracy: 0.0,
      altitude: 0.0,
      altitudeAccuracy: 0.0,
      heading: 0.0,
      headingAccuracy: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0,
    );
  }
}
