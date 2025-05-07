import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:public_parking_info_fe/data/datasource/kakao_search_address_api.dart';
import 'package:public_parking_info_fe/data/models/parking_info.dart';
import 'package:public_parking_info_fe/presentation/widgets/fast_search.dart';
import 'package:public_parking_info_fe/providers/map_provider.dart';
import 'package:public_parking_info_fe/services/map_service.dart';

class MapServiceImpl implements MapService {
  // 싱글톤
  MapServiceImpl._internal();
  static final MapServiceImpl _instance = MapServiceImpl._internal();
  static MapServiceImpl get instance => _instance;

  Set<ParkingInfo> _cachedParkingList = {};
  Set<Marker> _cachedMarkList = {};
  final String defaultMarkerImg =
      "https://velog.velcdn.com/images/luna-han/post/869cb99f-b485-49b0-8c7d-04d0ab0f9762/image.png";
  final String selectedMarkerImg =
      "https://velog.velcdn.com/images/luna-han/post/e9628f6d-4882-46db-9781-a9bccfb095f1/image.png";

  bool _isRequestingLocation = false;

  @override
  Future<Position?> getCurrentLocation() async {
    if (_isRequestingLocation) return null;
    _isRequestingLocation = true;

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) return null;

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied ||
            permission == LocationPermission.deniedForever) {
          return null;
        }
      }

      return await Geolocator.getCurrentPosition();
    } catch (e) {
      print('Location error: $e');
      return null;
    } finally {
      _isRequestingLocation = false;
    }
  }

  // GPS 비활성화 또는 위치제공 미동의시 기본 위치 반환, 위치제공 동의시 현재 위치 반환
  @override
  Future<Position> setInitialLocation() async {
    Position initialPosition = getSeoulStationLocation();
    getCurrentLocation();

    Position? currentLocation = await getCurrentLocation();

    if (currentLocation != null) {
      return currentLocation;
    } else {
      return initialPosition;
    }
  }

  // 주차장 JSON 데이터 모델로 변환
  @override
  Future<List<ParkingInfo>> loadParkingData() async {
    if (_cachedParkingList.isNotEmpty) return _cachedParkingList.toList();

    final String jsonString = await rootBundle.loadString(
      "assets/data/parking.json",
    );

    final List jsonList = json.decode(jsonString);
    List<ParkingInfo> parkingList =
        jsonList.map((json) => ParkingInfo.fromJson(json)).toList();
    _cachedParkingList.addAll(parkingList);

    return parkingList;
  }

  // 주차장 마커 표시
  @override
  Future<void> addMarkersInView(KakaoMapController mapController) async {
    final List<ParkingInfo> parkingList = await loadParkingData();
    final center = await mapController.getCenter();

    final double ctlat = center.latitude;
    final double ctlon = center.longitude;
    final double radius = 1000;

    // 반경 내 주차장 필터링
    final visibleParkings =
        parkingList.where((parking) {
          final distance = Geolocator.distanceBetween(
            ctlat,
            ctlon,
            parking.lat,
            parking.lon,
          );
          return distance <= radius;
        }).toList();

    // 중복 좌표 제거
    final uniqueCoordinates = <String>{};
    final filteredParkings =
        visibleParkings.where((parking) {
          final key = "${parking.lat},${parking.lon}";
          return uniqueCoordinates.add(key); // add는 중복이면 false 반환
        }).toList();

    _cachedMarkList.clear();

    final newMarkers =
        filteredParkings.map((parking) {
          return Marker(
            markerId: parking.mngNo.toString(),
            latLng: LatLng(parking.lat, parking.lon),
            width: 40,
            height: 40,
            markerImageSrc: defaultMarkerImg,
          );
        }).toList();

    _cachedMarkList.addAll(newMarkers);
    await mapController.addMarker(markers: newMarkers);
  }

  // 마커 상태 관리용 Map
  Map<String, bool> _markerSelectionStatus = {};

  @override
  Future<void> updateMarker({
    required KakaoMapController mapController,
    required String markerId,
    required LatLng latLng,
    required WidgetRef ref,
  }) async {
    ParkingInfo parkingInfo = _cachedParkingList.firstWhere(
      (parkingInfo) =>
          isSameLocation(parkingInfo.lat, latLng.latitude) &&
          isSameLocation(parkingInfo.lon, latLng.longitude),
    );

    ref.read(targetParkingProvider.notifier).state = parkingInfo;
    await mapController.clear();

    // 마커 삭제(작동 안됨)
    await mapController.clearMarker(markerIds: [markerId]);

    // 기존 마커 리스트에서 해당 마커 제거
    _cachedMarkList.removeWhere((Marker marker) => marker.markerId == markerId);

    // 새로운 마커 생성
    Marker updatedMarker = Marker(
      markerId: markerId,
      latLng: latLng,
      width: 40,
      height: 40,
      markerImageSrc: selectedMarkerImg, // 이미지 변경
    );

    // 새로운 마커 추가
    _cachedMarkList.add(updatedMarker);
    await mapController.addMarker(markers: _cachedMarkList.toList());
    // 중심 이동
    await mapController.setCenter(latLng);
  }

  // 지도 배경 클릭 시 마커 이미지를 원래 상태로 되돌리기(보류)
  @override
  Future<void> onMapBackgroundClick(
    KakaoMapController mapController,
    String markerId,
  ) async {
    try {
      final updatedMarkers =
          _cachedMarkList.map((marker) {
            return Marker(
              markerId: marker.markerId,
              latLng: marker.latLng,
              width: 40,
              height: 40,
              markerImageSrc: defaultMarkerImg,
            );
          }).toList();

      // 지도에 마커 업데이트
      await mapController.clear();
      // await mapController.clearMarker(markerIds: [markerId]);

      await Future.delayed(Duration(milliseconds: 100));
      await mapController.addMarker(markers: updatedMarkers);
    } catch (e) {
      print("onMapBackgroundClick 오류: $e");
    }
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

  // 좌표로 주소 정보 조회
  @override
  ParkingInfo? getParkingInfo(LatLng latLng) {
    return _cachedParkingList.firstWhere(
      (parkingInfo) =>
          parkingInfo.lat == latLng.latitude &&
          parkingInfo.lon == latLng.longitude,
    );
  }

  // id로 주소 정보 조회
  @override
  ParkingInfo? getParkingInfoByMngNo(String mngNo) {
    return _cachedParkingList.firstWhere(
      (parkingInfo) => parkingInfo.mngNo.toString() == mngNo,
    );
  }

  @override
  List<ParkingInfoWithDistance> getParkingNearby({
    required double lat,
    required double lon,
    required int radiusMeters,
  }) {
    return _cachedParkingList
        .map((parking) {
          // 거리 계산
          final distance = _calculateDistance(
            lat,
            lon,
            parking.lat,
            parking.lon,
          );

          // ParkingInfo와 거리 정보를 함께 담은 객체 생성
          return ParkingInfoWithDistance(
            parkingInfo: parking, // ParkingInfo 객체
            distance: distance, // 계산된 거리
          );
        })
        .where((e) => e.distance <= radiusMeters) // 거리 기준으로 필터링
        .toList()
      ..sort((a, b) => a.distance.compareTo(b.distance)); // 거리 순으로 정렬
  }

  // 서울역 좌표
  @override
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

  double _calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const earthRadius = 6371000;

    final dLat = _degreesToRadians(lat2 - lat1);
    final dLon = _degreesToRadians(lon2 - lon1);

    final a =
        sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreesToRadians(lat1)) *
            cos(_degreesToRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }

  bool isSameLocation(double a, double b) {
    return a.toStringAsFixed(7) == b.toStringAsFixed(7);
  }
}
