import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/presentation/widgets/custom_bottom_button.dart';

class RequestLoginSheet extends ConsumerStatefulWidget {
  const RequestLoginSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RequestLoginSheetState();
}

class _RequestLoginSheetState extends ConsumerState<RequestLoginSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "계정을 만들고 서비스를 이용해 보세요!",
          style: CustomFonts.w600(fontSize: 18, color: CustomColors.darkGrey),
        ),
        SizedBox(height: 20),

        Text(
          "로그인 이후 서비스 이용이 가능합니다.",
          style: CustomFonts.w400(fontSize: 16, color: CustomColors.darkGrey),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: GestureDetector(
            onTap: () {
              context.pushNamed("login");
            },
            child: CustomBottomButton(
              color: CustomColors.primary,
              text: "이메일 로그인",
              fontColor: Colors.white,
              radius: 6,
            ),
          ),
        ),
        // Text("건너뛰기", style: CustomFonts.w600(fontSize: 16, color: CustomColors.darkGrey)),
        GestureDetector(
          onTap: () => context.pushNamed("main"),
          child: Text(
            "건너뛰기",
            style: CustomFonts.w600(fontSize: 16, color: CustomColors.darkGrey),
          ),
        ),
      ],
    );
  }
}
