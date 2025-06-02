import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OpacityButton extends ConsumerStatefulWidget {
  final Function onTap;
  // final String? text;
  // final TextStyle? textStyle;
  // final String? img;
  // final Color? imgColor;
  // final double? imgSize;
  // final double? paddingTop;
  final double? size;
  final EdgeInsets? padding;
  final BoxDecoration? decoration;
  final Widget? child;
  const OpacityButton({
    required this.onTap,
    // this.text,
    // this.textStyle,
    // this.img,
    // this.imgColor,
    // this.imgSize,
    // this.paddingTop,
    this.size,
    this.padding,
    this.decoration,
    this.child,
    super.key,
  });

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
      child: Opacity(
        opacity: isTap ? 0.6 : 1.0,
        child: Container(
          width: widget.size,
          height: widget.size,
          padding: widget.padding,
          decoration: widget.decoration,
          child: widget.child,
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     if (widget.img != null)
          //       Image.asset(widget.img!, width: widget.imgSize, color: widget.imgColor),
          //     SizedBox(height: widget.paddingTop),
          //     if (widget.text != null) Text(widget.text!, style: widget.textStyle),
          //   ],
          // ),
        ),
      ),
    );
  }
}
