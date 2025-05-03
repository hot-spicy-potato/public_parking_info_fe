import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';

class SelectReviewButton extends ConsumerWidget {
  final Function onTap;
  final String iconSrc;
  final String text;
  const SelectReviewButton({
    required this.onTap,
    required this.iconSrc,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: 98,
        height: 98,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: CustomColors.primary, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(iconSrc, width: 24, height: 24),
            SizedBox(height: 16),
            Text(
              text,
              style: CustomFonts.w400(
                fontSize: 14,
                color: CustomColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
