import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/text_styles.dart';
import 'package:public_parking_info_fe/presentation/common_widgets/opacity_button.dart';
import 'package:public_parking_info_fe/presentation/map/providers/map_provider.dart';
import 'package:public_parking_info_fe/resources/resources.dart';
import 'package:public_parking_info_fe/services/map_service.dart';

class SearchField extends ConsumerStatefulWidget {
  const SearchField({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchFieldState();
}

class _SearchFieldState extends ConsumerState<SearchField> {
  late TextEditingController textEditingController;
  final MapService mapService = MapService.instance;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final mapController = ref.watch(mapControllerProvider);

    void searchEvent(String value) async {
      if (value.isNotEmpty) {
        // 검색 후 지도 이동
        await mapService.searchAddress(textEditingController.text).then((targetPosition) {
          if (targetPosition != null && mapController != null) {
            mapService.setMapCenter(
              mapController: mapController,
              lat: targetPosition.latitude,
              lon: targetPosition.longitude,
            );
          }
        });
      }
    }

    return SafeArea(
      child: IntrinsicHeight(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          margin: const EdgeInsets.symmetric(horizontal: 18),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: textEditingController,
                  onSubmitted: (value) => searchEvent(value),
                  cursorHeight: 16,
                  cursorColor: CustomColors.primary,
                  decoration: InputDecoration(
                    hintText: "목적지 또는 주소 검색",
                    hintStyle: TextStyles.style(
                      color: CustomColors.lightGrey,
                      fontSize: 16,
                      fontWeight: 4,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
              OpacityButton(
                onTap: () => searchEvent(textEditingController.text),
                child: Image.asset(Images.searchIcon, width: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
