import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:public_parking_info_fe/data/datasource/kakao_search_address_api.dart';
import 'package:public_parking_info_fe/data/models/parking_info.dart';
import 'package:public_parking_info_fe/presentation/map/widgets/fast_search.dart';
import 'package:public_parking_info_fe/presentation/map/providers/map_provider.dart';

class MapService {
  MapService._internal();
  static final MapService _instance = MapService._internal();
  static MapService get instance => _instance;

  Set<ParkingInfo> parkingList = {};
  Set<Marker> markerList = {};

  final String defaultMarkerImg =
      "https://velog.velcdn.com/images/luna-han/post/869cb99f-b485-49b0-8c7d-04d0ab0f9762/image.png";
  final String selectedMarkerImg =
      "https://velog.velcdn.com/images/luna-han/post/e9628f6d-4882-46db-9781-a9bccfb095f1/image.png";

  Future<List<ParkingInfo>> loadParkingdata() async {
    if (parkingList.isNotEmpty) return parkingList.toList();

    final String jsonString = await rootBundle.loadString("assets/data/parking.json");

    final List jsonList = json.decode(jsonString);

    parkingList.addAll(jsonList.map((json) => ParkingInfo.fromJson(json)).toList());

    return parkingList.toList();
  }

  Future<void> addMarkersInView(KakaoMapController controller) async {
    final List<ParkingInfo> parkingList = await loadParkingdata();
    final center = await controller.getCenter();

    final double ctlat = center.latitude;
    final double ctlon = center.longitude;
    final double radius = 1000; // 반경

    // 반경 내 주차장 필터링
    final visibleParkings =
        parkingList.where((parking) {
          final distance = Geolocator.distanceBetween(ctlat, ctlon, parking.lat, parking.lon);
          return distance <= radius;
        }).toList();

    // 중복 좌표 제거
    final uniqueCoordinates = <String>{};
    final filteredParkings =
        visibleParkings.where((parking) {
          final key = "${parking.lat},${parking.lon}";
          return uniqueCoordinates.add(key); // add는 중복이면 false 반환
        }).toList();

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

    markerList.addAll(newMarkers);
    await controller.addMarker(markers: newMarkers);
  }

  Future<void> updateMarker({
    required KakaoMapController controller,
    required String markerId,
    required LatLng latLng,
    required WidgetRef ref,
  }) async {
    ParkingInfo parkingInfo = parkingList.firstWhere(
      (parkingInfo) =>
          isSameLocation(parkingInfo.lat, latLng.latitude) &&
          isSameLocation(parkingInfo.lon, latLng.longitude),
    );

    ref.read(targetParkingProvider.notifier).setParkingInfo(parkingInfo);

    // 기존 마커 리스트에서 해당 마커 제거
    markerList.removeWhere((Marker marker) => marker.markerId == markerId);
    List<String> markerIdsToKeep = markerList.map((marker) => marker.markerId.toString()).toList();

    await controller.clearMarker(markerIds: markerIdsToKeep);

    // 새로운 마커 생성
    Marker updatedMarker = Marker(
      markerId: markerId,
      latLng: latLng,
      width: 40,
      height: 40,
      markerImageSrc: selectedMarkerImg, // 이미지 변경
    );

    // 새로운 마커 추가
    markerList.add(updatedMarker);
    await controller.addMarker(markers: markerList.toList());

    // 중심 이동
    await controller.setCenter(latLng);
  }

  // kakao search api
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
  ParkingInfo? getParkingInfo(LatLng latLng) {
    return parkingList.firstWhere(
      (parkingInfo) => parkingInfo.lat == latLng.latitude && parkingInfo.lon == latLng.longitude,
    );
  }

  // id로 주소 정보 조회
  ParkingInfo? getParkingInfoByCode(String code) {
    return parkingList.firstWhere((parkingInfo) => parkingInfo.mngNo.toString() == code);
  }

  List<ParkingInfoWithDistance> getParkingNearby({
    required double lat,
    required double lon,
    required int radiusMeters,
  }) {
    return parkingList
        .map((parking) {
          // 거리 계산
          final distance = calculateDistance(lat, lon, parking.lat, parking.lon);

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

  bool isSameLocation(double a, double b) {
    return a.toStringAsFixed(7) == b.toStringAsFixed(7);
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const earthRadius = 6371000;

    final dLat = _degreesToRadians(lat2 - lat1);
    final dLon = _degreesToRadians(lon2 - lon1);

    final a =
        sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreesToRadians(lat1)) * cos(_degreesToRadians(lat2)) * sin(dLon / 2) * sin(dLon / 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }

  // 지도 배경 클릭 시 마커 이미지를 원래 상태로 되돌리기(보류)
  Future<void> onMapBackgroundClick(KakaoMapController mapController, String markerId) async {
    try {
      final updatedMarkers =
          markerList.map((marker) {
            return Marker(
              markerId: marker.markerId,
              latLng: marker.latLng,
              width: 40,
              height: 40,
              markerImageSrc: defaultMarkerImg,
            );
          }).toList();

      // 기존 마커 리스트에서 해당 마커 제거
      markerList.removeWhere((Marker marker) => marker.markerId == markerId);
      List<String> markerIdsToKeep =
          markerList.map((marker) => marker.markerId.toString()).toList();

      await mapController.clearMarker(markerIds: markerIdsToKeep);

      await Future.delayed(Duration(milliseconds: 100));
      await mapController.addMarker(markers: updatedMarkers);
    } catch (e) {
      print("onMapBackgroundClick 오류: $e");
    }
  }
}
