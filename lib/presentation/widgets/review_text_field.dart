import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/providers/write_review_provider.dart';

class ReviewTextField extends ConsumerStatefulWidget {
  const ReviewTextField({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReviewTextFieldState();
}

class _ReviewTextFieldState extends ConsumerState<ReviewTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: CustomColors.textField, width: 1),
      ),
      child: TextField(
        onChanged: (value) {
          ref.read(writeReviewProvider.notifier).setContent(value);
        },
        maxLines: null,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          hintText: "유용한 팁을 알려주세요!\n작성 내용은 장소상세에 노출됩니다.",
          hintStyle: CustomFonts.w400(
            fontSize: 16,
            color: CustomColors.lightGrey,
            letterSpacing: -0.4,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
