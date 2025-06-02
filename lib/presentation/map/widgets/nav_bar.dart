import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/text_styles.dart';
import 'package:public_parking_info_fe/presentation/common_widgets/custom_bottom_sheet.dart';
import 'package:public_parking_info_fe/presentation/common_widgets/opacity_button.dart';
import 'package:public_parking_info_fe/presentation/favorite/widgets/favorite_list.dart';
import 'package:public_parking_info_fe/presentation/login/widgets/login_request.dart';
import 'package:public_parking_info_fe/presentation/splash/providers/splash_page_provider.dart';
import 'package:public_parking_info_fe/resources/resources.dart';
import 'package:public_parking_info_fe/services/user_service.dart';

class NavBar extends ConsumerWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserService userService = UserService.instance;

    Future<String?> getToken() async {
      final String? token = await userService.getAccessToken();
      return token;
    }

    return Container(
      width: double.infinity,
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, spreadRadius: 2)],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(
                index: 0,
                onTap: () {
                  ref.read(splashPageProvider.notifier).state = 0;
                },
              ),
              _NavItem(
                index: 1,
                onTap: () async {
                  final token = await getToken();
                  if (token == null) {
                    showCustomBottomSheet(
                      context,
                      barrierColor: Colors.black.withOpacity(0.4),
                      child: LoginRequest(),
                    );
                  } else {
                    ref.read(splashPageProvider.notifier).state = 1;
                    showCustomBottomSheet(
                      context,
                      barrierColor: Colors.black.withOpacity(0.4),
                      child: FavoriteList(token: token),
                    ).then((value) => ref.read(splashPageProvider.notifier).state = 0);
                  }
                },
              ),
              _NavItem(
                index: 2,
                onTap: () async {
                  final token = await getToken();
                  if (token == null) {
                    showCustomBottomSheet(
                      context,
                      barrierColor: Colors.black.withOpacity(0.4),
                      child: LoginRequest(),
                    );
                  } else {
                    ref.read(splashPageProvider.notifier).state = 2;
                    context.pushNamed("mypage");
                  }
                },
              ),
            ],
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _NavItem extends ConsumerWidget {
  final int index;
  final Function onTap;
  const _NavItem({required this.index, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isSelected = ref.watch(splashPageProvider) == index;

    List imgs = [Images.tabbarHomeIcon, Images.tabbarFavoriteIcon, Images.tabbarMypageIcon];
    List selectedImgs = [
      Images.selectedTabbarHomeIcon,
      Images.selectedTabbarFavoriteIcon,
      Images.selectedTabbarMypageIcon,
    ];
    List text = ["홈", "즐겨찾기", "내 정보"];

    return OpacityButton(
      onTap: () => onTap(),
      child: Column(
        children: [
          Image.asset(isSelected ? selectedImgs[index] : imgs[index], width: 24),
          SizedBox(height: 4),
          Text(
            text[index],
            style: TextStyles.style(
              fontSize: 12,
              fontWeight: 4,
              color: isSelected ? CustomColors.primary : CustomColors.unselected,
            ),
          ),
        ],
      ),
    );
  }
}
