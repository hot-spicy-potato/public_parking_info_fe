import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/providers/map_provider.dart';
import 'package:public_parking_info_fe/resources/resources.dart';

class SkyViewButton extends ConsumerWidget {
  const SkyViewButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = ref.watch(mapControllerProvider);
    final mapService = ref.read(mapServiceProvider);
    final isSkyView = ref.watch(skyViewProvider);

    return GestureDetector(
      onTap: () async {
        ref.read(skyViewProvider.notifier).toggle();
        final isSkyView = ref.watch(skyViewProvider);

        isSkyView
            ? mapController?.addOverlayMapTypeId(MapType.skyView)
            : mapController?.removeOverlayMapTypeId(MapType.skyView);
      },
      child: Container(
        width: 48,
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSkyView ? const Color(0xFF613EEA) : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              spreadRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Images.skyViewIcon,
              width: 16,
              height: 16,
              color: isSkyView ? Colors.white : null,
            ),
            const SizedBox(height: 4),
            Text(
              "로드뷰",
              style: CustomFonts.w500(
                fontSize: 9,
                color: isSkyView ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
