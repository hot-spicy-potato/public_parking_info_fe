import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OpacityButton extends ConsumerStatefulWidget {
  final Function onTap;
  final Widget child;
  const OpacityButton({required this.onTap, required this.child, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OpacityButtonState();
}

class _OpacityButtonState extends ConsumerState<OpacityButton> {
  bool isTap = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      // button click
      onTapDown: (details) {
        isTap = true;
        setState(() {});
      },
      // button unclick
      onTapUp: (details) {
        isTap = false;
        setState(() {});
      },
      onTapCancel: () {
        isTap = false;
        setState(() {});
      },
      child:
          isTap
              ? Container(color: Colors.white.withOpacity(0.6), child: widget.child)
              : widget.child,
    );
  }
}
