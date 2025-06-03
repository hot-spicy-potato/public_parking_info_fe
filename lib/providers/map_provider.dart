import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:public_parking_info_fe/data/models/parking_info.dart';
import 'package:public_parking_info_fe/services/map_service.dart';

final mapControllerProvider = StateProvider<KakaoMapController?>((ref) => null);

final mapServiceProvider = Provider<MapService>((ref) {
  return MapService.instance;
});

final targetParkingProvider =
    StateNotifierProvider<TargetParkingNotifier, ParkingInfo?>(
      (ref) => TargetParkingNotifier(),
    );

class TargetParkingNotifier extends StateNotifier<ParkingInfo?> {
  TargetParkingNotifier() : super(null);

  ParkingInfo? getParkingInfo() {
    return state;
  }

  void setParkingInfo(ParkingInfo parkingInfo) {
    state = parkingInfo;
  }
}

class RoadViewNotifier extends StateNotifier<bool> {
  RoadViewNotifier() : super(false);

  void toggle() => state = !state;
  void remove() => state = false;
}

class SkyViewNotifier extends StateNotifier<bool> {
  SkyViewNotifier() : super(false);

  void toggle() => state = !state;
  void remove() => state = false;
}

final roadViewProvider = StateNotifierProvider<RoadViewNotifier, bool>(
  (ref) => RoadViewNotifier(),
);

final skyViewProvider = StateNotifierProvider<SkyViewNotifier, bool>(
  (ref) => SkyViewNotifier(),
);
