import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void showCustomBottomSheet(BuildContext context, {required Widget child}) {
  showModalBottomSheet(
    context: context,
    barrierColor: Colors.transparent,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
    ),
    builder: (context) => CustomBottomSheet(child: child),
  );
}

class CustomBottomSheet extends ConsumerWidget {
  final Widget child;
  const CustomBottomSheet({required this.child, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height = MediaQuery.sizeOf(context).height;

    return SafeArea(
      child: Container(
        width: double.infinity,
        height: height * 0.3,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: child,
      ),
    );
  }
}
