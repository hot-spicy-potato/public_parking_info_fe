import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/core/utils/screen_util.dart';
import 'package:public_parking_info_fe/presentation/map/widgets/current_location_button.dart';
import 'package:public_parking_info_fe/presentation/map/widgets/fast_search.dart';
import 'package:public_parking_info_fe/presentation/map/widgets/nav_bar.dart';
import 'package:public_parking_info_fe/presentation/map/widgets/road_view_button.dart';

class BottomButtons extends ConsumerWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FastSearch(),
            SizedBox(width: screenWidth(context) / 3 - 48),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [RoadViewButton(), SizedBox(height: 6), CurrentLocationButton()],
              ),
            ),
          ],
        ),
        NavBar(),
      ],
    );
  }
}
