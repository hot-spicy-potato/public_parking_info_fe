import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/text_styles.dart';
import 'package:public_parking_info_fe/presentation/common_widgets/opacity_bottom_button.dart';
import 'package:public_parking_info_fe/presentation/common_widgets/opacity_button.dart';

class LoginRequest extends ConsumerStatefulWidget {
  const LoginRequest({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RequestLoginSheetState();
}

class _RequestLoginSheetState extends ConsumerState<LoginRequest> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("계정을 만들고 서비스를 이용해 보세요!", style: TextStyles.style(fontSize: 18, fontWeight: 6)),
        SizedBox(height: 20),
        Text("로그인 이후 더욱 다양한 서비스 이용이 가능합니다.", style: TextStyles.style(fontSize: 16, fontWeight: 4)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: OpacityBottomButton(
            onTap: () {
              context.pushNamed("login");
            },
            text: "이메일 로그인",
          ),
        ),
        OpacityButton(
          onTap: () {
            context.pop();
          },
          child: Text(
            "건너뛰기",
            style: TextStyles.style(fontSize: 16, fontWeight: 4, color: CustomColors.darkGrey2),
          ),
        ),
      ],
    );
  }
}
