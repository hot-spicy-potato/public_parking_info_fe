import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/presentation/splash/providers/page_provider.dart';
import 'package:public_parking_info_fe/providers/user_api_provider.dart';
import 'package:public_parking_info_fe/resources/resources.dart';

class MyPage extends ConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            ref.read(pageProvider.notifier).state = 0;
            context.pop();
          },
          child: Icon(Icons.arrow_back_ios, color: CustomColors.darkGrey, size: 15),
        ),
        title: Text("내 정보", style: CustomFonts.w700(fontSize: 18, color: CustomColors.darkGrey)),
      ),
      body: ref
          .watch(userInfoProvider)
          .when(
            data: (data) {
              if (data == null) {
                return Center(
                  child: Text(
                    "회원 정보를 찾을 수 없습니다.",
                    style: CustomFonts.w400(fontSize: 18, color: CustomColors.darkGrey),
                  ),
                );
              }
              return SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 20),
                      child: Image.asset(Images.profileIcon, width: 80, height: 80),
                    ),
                    Text(
                      data.name,
                      style: CustomFonts.w600(fontSize: 16, color: CustomColors.darkGrey),
                    ),
                    Text(
                      data.email,
                      style: CustomFonts.w400(fontSize: 16, color: CustomColors.darkGrey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(color: CustomColors.lightGrey, thickness: 1, height: 40),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        context.pushNamed("deleteUser");
                      },
                      child: Text(
                        "탈퇴하기",
                        style: CustomFonts.w400(fontSize: 16, color: CustomColors.darkGrey),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () async {
                        await userService.logout();
                        context.pushReplacementNamed("main");
                      },
                      child: Text(
                        "로그아웃",
                        style: CustomFonts.w400(fontSize: 16, color: CustomColors.darkGrey),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              );
            },
            error: (error, stackTrace) => Center(child: CircularProgressIndicator()),
            loading: () => Center(child: CircularProgressIndicator()),
          ),
    );
  }
}
