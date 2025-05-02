import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:public_parking_info_fe/data/models/parking_info.dart';

final mapControllerProvider = StateProvider<KakaoMapController?>((ref) => null);

final targetParkingProvider = StateProvider<ParkingInfo?>((ref) => null);
