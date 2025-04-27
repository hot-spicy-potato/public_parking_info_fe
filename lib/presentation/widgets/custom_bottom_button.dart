import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomBottomButton extends ConsumerWidget {
  const CustomBottomButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        // showCustomBottomSheet(context);
        final String jsonString = await rootBundle.loadString(
          'assets/data/parking.json',
        );
        final List jsonData = jsonDecode(jsonString);
        print(jsonData.first);
      },
      child: Container(
        width: 100,
        height: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black54,
          shape: BoxShape.circle,
        ),
        child: Text("test", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
