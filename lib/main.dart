import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_share.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:public_parking_info_fe/core/constants/keys.dart';
import 'package:public_parking_info_fe/core/utils/deep_link_handler.dart';
import 'package:public_parking_info_fe/data/models/parking_info.dart';
import 'package:public_parking_info_fe/data/models/response/review_info_response.dart';
import 'package:public_parking_info_fe/presentation/pages/parking_map_page.dart';
import 'package:public_parking_info_fe/presentation/pages/review_page.dart';
import 'package:public_parking_info_fe/presentation/pages/road_view_page.dart';
import 'package:public_parking_info_fe/presentation/pages/splash_page.dart';
import 'package:public_parking_info_fe/presentation/pages/write_review_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  KakaoSdk.init(nativeAppKey: kakaoNativeAppKey);
  AuthRepository.initialize(appKey: kakaoAppKey);

  final prefs = await SharedPreferences.getInstance();
  final accessToken = prefs.getString("accessToken");
  final isLoggedIn = accessToken != null;

  runApp(ProviderScope(child: MyApp(isLoggedIn: isLoggedIn)));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({required this.isLoggedIn, super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> _rootNavigatorKey =
        GlobalKey<NavigatorState>();
    DeepLinkHandler.init(context, _rootNavigatorKey);

    final router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: isLoggedIn ? "/main" : "/splash",
      routes: [
        GoRoute(
          name: "splash",
          path: "/splash",
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          name: "main",
          path: "/main",
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
        GoRoute(
          name: "review",
          path: "/review",
          builder: (context, state) {
            final extra = GoRouterState.of(context).extra as Map;
            final parkingInfo = extra["parkingInfo"] as ParkingInfo;
            final reviewInfo = extra["reviewInfo"] as ReviewInfoResponse;
            return ReviewPage(parkingInfo: parkingInfo, reviewInfo: reviewInfo);
          },
        ),
        GoRoute(
          name: "writeReview",
          path: "/write-review",
          builder: (context, state) => WriteReviewPage(),
        ),
      ],
    );

    return MaterialApp.router(routerConfig: router, title: "공영주차알리미");
  }
}
