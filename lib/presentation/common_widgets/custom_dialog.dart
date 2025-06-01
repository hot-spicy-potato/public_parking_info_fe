import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void showCustomDialog(BuildContext context, {required Widget child}) {
  showDialog(
    context: context,
    builder: (context) => CustomDialog(child: child),
  );
}

class CustomDialog extends ConsumerWidget {
  final Widget child;

  const CustomDialog({required this.child, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: child,
      ),
    );
  }
}
