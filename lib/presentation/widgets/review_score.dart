import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/presentation/widgets/review_rate.dart';
import 'package:public_parking_info_fe/providers/api_provider.dart';

class ReviewScore extends ConsumerWidget {
  final String mngNo;
  const ReviewScore({required this.mngNo, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(reviewInfoProvider(mngNo))
        .when(
          data: (data) {
            if (data == null) return _widget(0, 0);
            return _widget(data.score.toInt(), data.total);
          },
          error: (error, stackTrace) => _widget(0, 0),
          loading: () => _widget(0, 0),
        );
  }

  Widget _widget(int score, int totalNum) {
    return // 통계
    Row(
      children: [
        Text(
          score.toStringAsFixed(2),
          style: CustomFonts.w600(fontSize: 20, color: CustomColors.primary),
        ),
        SizedBox(width: 6),
        ReviewRate(value: score, size: 16, paddingRight: 2),
        Spacer(),
        Text(
          "후기 ${totalNum.toString()}",
          style: CustomFonts.w400(fontSize: 16, color: CustomColors.grey),
        ),
      ],
    );
  }
}
