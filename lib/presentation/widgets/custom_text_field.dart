import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';

class CustomTextField extends ConsumerStatefulWidget {
  final String title;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? passwordController;
  final Function(String)? onChanged;
  const CustomTextField({
    required this.title,
    required this.hintText,
    required this.onChanged,
    this.validator,
    this.passwordController,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends ConsumerState<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: CustomFonts.w600(fontSize: 18, color: CustomColors.darkGrey)),
          TextFormField(
            onChanged: widget.onChanged,
            style: CustomFonts.w400(
              fontSize: 16,
              color: CustomColors.darkGrey,
              letterSpacing: -0.3,
            ),
            controller: widget.passwordController,
            autovalidateMode: AutovalidateMode.onUnfocus,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: CustomColors.lightGrey),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: CustomColors.primary),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: CustomColors.lightGrey),
              ),
              hintText: widget.hintText,
              hintStyle: CustomFonts.w400(
                fontSize: 16,
                color: CustomColors.lightGrey,
                letterSpacing: -0.3,
              ),
              errorStyle: CustomFonts.w400(
                fontSize: 14,
                color: CustomColors.dangerous,
                letterSpacing: -0.3,
              ),
            ),
            validator: widget.validator,
          ),
        ],
      ),
    );
  }
}
