import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/presentation/widgets/splash_first.dart';
import 'package:public_parking_info_fe/presentation/widgets/splash_second.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: height * 0.7,
              child: PageView.builder(
                controller: pageController,
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return pages[index];
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: SmoothPageIndicator(
                controller: pageController,
                count: pages.length,
                effect: WormEffect(
                  activeDotColor: CustomColors.primary,
                  dotColor: CustomColors.lightGrey,
                  dotHeight: 8,
                  dotWidth: 8,
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
            ),
          ],
        ),
      ),
    );
  }
}
