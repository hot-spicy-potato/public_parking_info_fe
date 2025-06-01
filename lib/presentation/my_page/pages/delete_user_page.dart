import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/presentation/common_widgets/custom_bottom_button.dart';
import 'package:public_parking_info_fe/presentation/splash/providers/splash_page_provider.dart';
import 'package:public_parking_info_fe/providers/user_api_provider.dart';
import 'package:public_parking_info_fe/resources/resources.dart';

class DeleteUserPage extends ConsumerWidget {
  const DeleteUserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(Icons.arrow_back_ios, color: CustomColors.darkGrey, size: 15),
        ),
        title: Text("탈퇴하기", style: CustomFonts.w700(fontSize: 18, color: CustomColors.darkGrey)),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: () async {
              await ref.read(userApiProvider.notifier).deleteUser();
              userService.logout();
              ref.read(splashPageProvider.notifier).state = 0;
              context.pushReplacementNamed("main");
            },
            child: CustomBottomButton(
              color: CustomColors.unselected,
              text: "탈퇴하기",
              fontColor: Colors.white,
              height: 60,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.deleteUserIcon, width: 120, height: 120),
            SizedBox(height: 10),
            Text(
              "그동안 저희 서비스를 이용해 주셔서 진심으로 감사드립니다. 하단의 버튼 클릭시 정상적으로 탈퇴가 진행되며, 즉시 회원 정보가 삭제됩니다.",
              textAlign: TextAlign.center,
              style: CustomFonts.w400(fontSize: 18, color: CustomColors.darkGrey),
            ),
          ],
        ),
      ),
    );
  }
}
