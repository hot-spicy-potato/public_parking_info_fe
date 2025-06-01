import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/resources/resources.dart';

class CustomAppBar extends ConsumerWidget {
  final String title;
  const CustomAppBar({required this.title, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(
        title,
        style: CustomFonts.w600(fontSize: 18, color: CustomColors.darkGrey),
        textAlign: TextAlign.center,
      ),
      leading: GestureDetector(
        onTap: () => context.pop(),
        child: Image.asset(Images.arrowLeft, height: 16),
      ),
    );
  }
}
