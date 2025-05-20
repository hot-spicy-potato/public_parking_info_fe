import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/presentation/widgets/custom_bottom_button.dart';
import 'package:public_parking_info_fe/resources/resources.dart';

class CompletedSignupPage extends ConsumerWidget {
  const CompletedSignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: () => context.pushReplacementNamed("main"),
            child: CustomBottomButton(
              color: CustomColors.primary,
              text: "메인으로",
              fontColor: Colors.white,
              height: 60,
              radius: 12,
            ),
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 5),
            Image.asset(Images.completedSignupIcon, width: 120, height: 120),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(
                "회원가입 완료",
                style: CustomFonts.w700(fontSize: 24, color: CustomColors.primary),
              ),
            ),
            Text(
              "환영합니다!\n메인 화면으로 이동해 서비스를 계속 이용해 보세요.",
              textAlign: TextAlign.center,
              style: CustomFonts.w400(fontSize: 18, color: CustomColors.darkGrey),
            ),
          ],
        ),
      ),
    );
  }
}
