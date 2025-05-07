import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/resources/resources.dart';
import 'package:public_parking_info_fe/services/user_service.dart';
import 'package:public_parking_info_fe/services/user_service_impl.dart';

class RequestLoginSheet extends ConsumerStatefulWidget {
  const RequestLoginSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RequestLoginSheetState();
}

class _RequestLoginSheetState extends ConsumerState<RequestLoginSheet> {
  @override
  Widget build(BuildContext context) {
    final UserService userService = UserServiceImpl.instance;

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
        GestureDetector(
          onTap: () async {
            String? jwt = await userService.kakaoLogin(ref);
            if (jwt != null && jwt.isNotEmpty) {
              print("jwt token: $jwt");
              if (mounted) {
                context.pushNamed("main");
              }
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: CustomColors.kakao,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Images.kakaoLoginIcon, width: 24, height: 24),
                Expanded(
                  child: Center(
                    child: Text(
                      "카카오 로그인",
                      style: CustomFonts.w600(
                        fontSize: 16,
                        color: CustomColors.darkGrey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(
          "건너뛰기",
          style: CustomFonts.w600(fontSize: 16, color: CustomColors.darkGrey),
        ),
      ],
    );
  }
}
