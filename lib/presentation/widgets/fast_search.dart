import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/resources/resources.dart';

class FastSearch extends ConsumerWidget {
  const FastSearch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0x99000000),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Images.carIcon, width: 15),
          SizedBox(width: 8),
          Text(
            "빠른 탐색",
            style: CustomFonts.w500(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
