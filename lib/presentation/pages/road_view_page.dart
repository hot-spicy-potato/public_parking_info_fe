import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:public_parking_info_fe/providers/map_provider.dart';

class RoadViewPage extends ConsumerWidget {
  final LatLng latLng;
  const RoadViewPage({required this.latLng, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            ref.read(roadViewProvider.notifier).remove();
            context.pop();
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: KakaoRoadMap(center: latLng),
    );
  }
}
