import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/providers/map_provider.dart';
import 'package:public_parking_info_fe/services/map_service.dart';
import 'package:public_parking_info_fe/services/map_service_impl.dart';

class SearchField extends ConsumerStatefulWidget {
  const SearchField({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchFieldState();
}

class _SearchFieldState extends ConsumerState<SearchField> {
  late TextEditingController textEditingController;
  final MapService mapService = MapServiceImpl();

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final mapController = ref.watch(mapControllerProvider);

    return SafeArea(
      child: Container(
        width: double.infinity,
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        margin: const EdgeInsets.symmetric(horizontal: 18),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              color: Colors.black12,
              blurRadius: 12,
              spreadRadius: 6,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(Icons.menu, color: CustomColors.grey),
            SizedBox(width: 6),
            Expanded(
              child: TextField(
                controller: textEditingController,
                onSubmitted: (value) async {
                  if (value.isNotEmpty) {
                    // 검색 후 지도 이동
                    await mapService
                        .searchAddress(textEditingController.text)
                        .then((targetPosition) {
                          if (targetPosition != null && mapController != null) {
                            mapService.setMapCenter(
                              mapController: mapController,
                              lat: targetPosition.latitude,
                              lon: targetPosition.longitude,
                            );
                          }
                        });
                  }
                },
                decoration: InputDecoration(
                  hintText: "목적지 또는 주소 검색",
                  hintStyle: TextStyle(color: CustomColors.grey, fontSize: 16),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
