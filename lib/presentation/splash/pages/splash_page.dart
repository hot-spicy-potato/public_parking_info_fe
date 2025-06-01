import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/presentation/common_widgets/custom_text_button.dart';
import 'package:public_parking_info_fe/presentation/splash/widgets/splash_first.dart';
import 'package:public_parking_info_fe/presentation/splash/widgets/splash_second.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController pageController = PageController();
    final pages = [SplashFirst(), SplashSecond()];
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // pageview
              SizedBox(
                height: height - 210,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: pages.length,
                  itemBuilder: (context, index) {
                    return pages[index];
                  },
                ),
              ),
              // page indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextButton(
                    text: "건너뛰기",
                    textStyle: CustomFonts.w400(fontSize: 16, color: CustomColors.grey),
                    onTap: () {
                      context.pushNamed("main");
                    },
                  ),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: pages.length,
                    effect: WormEffect(
                      activeDotColor: CustomColors.primary,
                      dotColor: CustomColors.lightGrey,
                      dotHeight: 7,
                      dotWidth: 7,
                      type: WormType.underground,
                    ),
                    onDotClicked: (index) {
                      pageController.animateToPage(
                        index,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                  ),
                  CustomTextButton(
                    text: "다음",
                    textStyle: CustomFonts.w700(fontSize: 16, color: CustomColors.primary),
                    onTap: () {
                      if (pageController.page == pages.length - 1) {
                        // 마지막 페이지일 경우 main 페이지로 이동
                        context.pushNamed("main");
                      } else {
                        pageController.nextPage(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
