import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/text_styles.dart';
import 'package:public_parking_info_fe/presentation/common_widgets/opacity_button.dart';
import 'package:public_parking_info_fe/presentation/map/providers/map_provider.dart';
import 'package:public_parking_info_fe/resources/resources.dart';

class RoadViewButton extends ConsumerWidget {
  const RoadViewButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = ref.watch(mapControllerProvider);

    return OpacityButton(
      onTap: () {
        ref.read(roadViewProvider.notifier).toggle();
        final isRoadView = ref.watch(roadViewProvider);

        isRoadView
            ? mapController?.addOverlayMapTypeId(MapType.traffic)
            : mapController?.removeOverlayMapTypeId(MapType.traffic);
      },
      size: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, spreadRadius: 2, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Images.roadViewIcon, width: 16),
          SizedBox(height: 4),
          Text(
            "혼잡도",
            style: TextStyles.style(fontSize: 9, fontWeight: 5, color: CustomColors.grey),
          ),
        ],
      ),
    );
  }
}
