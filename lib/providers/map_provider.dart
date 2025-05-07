import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:public_parking_info_fe/data/models/parking_info.dart';

final mapControllerProvider = StateProvider<KakaoMapController?>((ref) => null);

final targetParkingProvider = StateProvider<ParkingInfo?>((ref) => null);

final markerProvider = StateProvider<String>((ref) => "");

final roadViewProvider = StateNotifierProvider<RoadViewNotifier, bool>(
  (ref) => RoadViewNotifier(),
);

class RoadViewNotifier extends StateNotifier<bool> {
  RoadViewNotifier() : super(false);

  void toggle() => state = !state;
  void remove() => state = false;
}
