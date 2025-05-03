import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:public_parking_info_fe/core/constants/keys.dart';
import 'package:public_parking_info_fe/presentation/pages/parking_map_page.dart';
import 'package:public_parking_info_fe/presentation/pages/road_view_page.dart';
import 'package:public_parking_info_fe/presentation/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AuthRepository.initialize(appKey: kakaoAppKey);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(
          name: "splash",
          path: "/splash",
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          name: "main",
          path: "/",
          builder: (context, state) => const ParkingMapPage(),
        ),
        GoRoute(
          name: "roadView",
          path: "/road-view",
          builder: (context, state) {
            final latlng = state.extra as LatLng;
            return RoadViewPage(latLng: latlng);
          },
        ),
      ],
    );

    return MaterialApp.router(routerConfig: router, title: "공영주차알리미");
  }
}
