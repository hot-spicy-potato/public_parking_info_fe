import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/presentation/review/providers/review_api_provider.dart';

class ReviewSortDropdown extends ConsumerWidget {
  const ReviewSortDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> items = ["별점순", "최신순"];

    String selectedValue = ref.watch(reviewSortProvider);

    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        dropdownStyleData: DropdownStyleData(
          padding: EdgeInsets.all(0),
          elevation: 1,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
        ),
        buttonStyleData: ButtonStyleData(padding: const EdgeInsets.all(0)),
        onChanged: (value) {
          selectedValue = value!;
          if (value == items[0]) {
            ref.read(reviewSortProvider.notifier).state = "score";
          } else {
            ref.read(reviewSortProvider.notifier).state = "reviewDate";
          }
        },
        value: selectedValue == "score" ? "별점순" : "최신순",
        items:
            items.map((String item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
      ),
    );
  }
}
