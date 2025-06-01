import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTextButton extends ConsumerStatefulWidget {
  final String text;
  final TextStyle textStyle;
  final Function onTap;
  const CustomTextButton({
    required this.text,
    required this.textStyle,
    required this.onTap,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends ConsumerState<CustomTextButton> {
  bool isTap = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
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
      child: Text(
        widget.text,
        style: TextStyle(
          fontFamily: widget.textStyle.fontFamily,
          fontWeight: widget.textStyle.fontWeight,
          fontSize: widget.textStyle.fontSize,
          color: isTap ? widget.textStyle.color?.withOpacity(0.6) : widget.textStyle.color,
          height: 0,
        ),
      ),
    );
  }
}
