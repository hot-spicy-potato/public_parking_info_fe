import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/text_styles.dart';
import 'package:public_parking_info_fe/presentation/common_widgets/opacity_text_button.dart';
import 'package:public_parking_info_fe/presentation/splash/widgets/splash_first.dart';
import 'package:public_parking_info_fe/presentation/splash/widgets/splash_second.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController pageController = PageController();
    final pages = [SplashFirst(), SplashSecond()];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // pageview
              Expanded(
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
                  OpacityTextButton(
                    onTap: () {
                      context.pushNamed("main");
                    },
                    text: "건너뛰기",
                    textStyle: TextStyles.style(
                      fontSize: 16,
                      fontWeight: 4,
                      color: CustomColors.grey,
                    ),
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
                  OpacityTextButton(
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
                    text: "다음",
                    textStyle: TextStyles.style(
                      fontSize: 16,
                      fontWeight: 7,
                      color: CustomColors.primary,
                    ),
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
