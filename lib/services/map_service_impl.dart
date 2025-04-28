import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:public_parking_info_fe/data/datasource/kakao_search_address_api.dart';
import 'package:public_parking_info_fe/data/models/parking_info.dart';
import 'package:public_parking_info_fe/services/map_service.dart';

class MapServiceImpl implements MapService {
  List<ParkingInfo>? _cachedParkingList;
  final List<Marker> cachedParkingList = [];

  // GPS 비활성화 또는 위치제공 미동의시 기본 위치 반환, 위치제공 동의시 현재 위치 반환
  @override
  Future<Position> getCurrentLocation() async {
    Position initialPosition = _initialPosition();

    // GPS 활성화 여부
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return initialPosition;
    }

    // 위치 제공 동의 여부
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      // 위치 제공 동의 요청
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        // 위치 제공 미동의시 서울역 좌표 반환
        return initialPosition;
      }
    }

    try {
      return await Geolocator.getCurrentPosition();
    } catch (e) {
      return initialPosition;
    }
  }

  // 주차장 JSON 데이터 모델로 변환
  @override
  Future<List<ParkingInfo>> loadParkingData() async {
    if (_cachedParkingList != null) return _cachedParkingList!;

    final String jsonString = await rootBundle.loadString(
      "assets/data/parking.json",
    );

    final List jsonList = json.decode(jsonString);
    return jsonList.map((json) => ParkingInfo.fromJson(json)).toList();
  }

  // 주차장 마커 표시
  @override
  Future<void> addMarkersInView(KakaoMapController mapController) async {
    final List<ParkingInfo> parkingList = await loadParkingData();

    final bounds = await mapController.getBounds();

    final double swLat = bounds.sw.latitude;
    final double swLng = bounds.sw.longitude;

    final newMarkers =
        parkingList
            .where((parking) {
              final double lat = parking.lat;
              final double lng = parking.lon;
              return lat <= swLat + 0.05 &&
                  lat >= swLat - 0.05 &&
                  lng <= swLng + 0.05 &&
                  lng >= swLng - 0.05;
            })
            .map((parking) {
              return Marker(
                markerId: parking.mngNo.toString(),
                latLng: LatLng(parking.lat, parking.lon),
                width: 40,
                height: 40,
                markerImageSrc:
                    "https://velog.velcdn.com/images/luna-han/post/869cb99f-b485-49b0-8c7d-04d0ab0f9762/image.png",
              );
            })
            .toList();

    cachedParkingList.addAll(newMarkers);

    await mapController.addMarker(markers: cachedParkingList);
  }

  // kakao search api
  @override
  Future<LatLng?> searchAddress(String keyword) async {
    if (keyword.isEmpty) return null;

    final data = await searchAddressAPI(keyword);

    final documents = data["documents"];

    if (documents != null && documents.isNotEmpty) {
      // 지도 이동 위해 가장 상위 결과만 반환
      final first = documents[0];
      final double lat = double.parse(first["y"]);
      final double lon = double.parse(first["x"]);
      return LatLng(lat, lon);
    }

    return null;
  }

  // 지도 위치 이동
  @override
  void setMapCenter({
    required KakaoMapController mapController,
    required double lat,
    required double lon,
    int? level,
  }) async {
    final LatLng targetPosition = LatLng(lat, lon);
    await mapController.setLevel(level ?? 5);
    await mapController.setCenter(targetPosition);
  }
}

// 서울역 좌표
Position _initialPosition() {
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
