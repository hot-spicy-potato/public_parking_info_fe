import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/text_styles.dart';

class OpacityBottomButton extends ConsumerStatefulWidget {
  final Function onTap;
  final String? text;
  final Color? textColor;
  final double? fontSize;
  final double? width;
  final double? height;
  final double? radius;
  final Color? buttonColor;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Widget? child;
  const OpacityBottomButton({
    required this.onTap,
    this.text,
    this.textColor,
    this.fontSize,
    this.width,
    this.height,
    this.radius,
    this.buttonColor,
    this.margin,
    this.padding,
    this.child,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OpacityBottomButtonState();
}

class _OpacityBottomButtonState extends ConsumerState<OpacityBottomButton> {
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
          width: widget.width ?? double.infinity,
          height: widget.height,
          padding: widget.padding ?? EdgeInsets.symmetric(vertical: 16),
          margin: widget.margin,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius ?? 6),
            color: widget.buttonColor ?? CustomColors.primary,
          ),
          child:
              widget.child ??
              Text(
                widget.text ?? "",
                style: TextStyles.style(
                  fontSize: widget.fontSize ?? 16,
                  fontWeight: 6,
                  color: widget.textColor ?? Colors.white,
                ),
              ),
        ),
      ),
    );
  }
}
