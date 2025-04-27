import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomMenuButton extends ConsumerWidget {
  final GlobalKey<ScaffoldState> sideBarKey;
  const CustomMenuButton({required this.sideBarKey, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: GestureDetector(
          onTap: () => sideBarKey.currentState?.openDrawer(),
          child: Icon(Icons.menu, size: 24, color: Colors.black),
        ),
      ),
    );
  }
}
