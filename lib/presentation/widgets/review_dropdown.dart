import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewDropdown extends ConsumerWidget {
  const ReviewDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> items = ["최신순", "별점순"];

    String selectedValue = items.first;

    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        dropdownStyleData: DropdownStyleData(
          padding: EdgeInsets.all(0),
          elevation: 1,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        buttonStyleData: ButtonStyleData(padding: const EdgeInsets.all(0)),
        onChanged: (value) {
          selectedValue = value!;
        },
        value: selectedValue,
        items:
            items
                .map(
                  (String item) =>
                      DropdownMenuItem(value: item, child: Text(item)),
                )
                .toList(),
      ),
    );
  }
}
