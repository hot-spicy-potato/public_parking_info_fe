import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/resources/resources.dart';

class ReviewRate extends ConsumerWidget {
  final int value;
  final double size;
  final double paddingRight;
  const ReviewRate({
    required this.value,
    required this.size,
    required this.paddingRight,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final icon = index < value ? Images.selectedStarIcon : Images.starIcon;
        return Padding(
          padding: EdgeInsets.only(right: index != 4 ? paddingRight : 0),
          child: Image.asset(icon, width: size, height: size),
        );
      }),
    );
  }
}
