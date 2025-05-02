import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';

class CustomBottomButton extends ConsumerWidget {
  final Color color;
  final String text;
  final Color fontColor;
  const CustomBottomButton({
    required this.color,
    required this.text,
    required this.fontColor,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: CustomFonts.w600(fontSize: 16, color: fontColor),
        ),
      ),
    );
  }
}
