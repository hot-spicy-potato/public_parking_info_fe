import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/presentation/widgets/custom_bottom_sheet.dart';
import 'package:public_parking_info_fe/presentation/widgets/request_login_sheet.dart';
import 'package:public_parking_info_fe/providers/api_provider.dart';
import 'package:public_parking_info_fe/resources/resources.dart';
import 'package:public_parking_info_fe/services/user_service.dart';
import 'package:public_parking_info_fe/services/user_service_impl.dart';

class FavoriteButton extends ConsumerStatefulWidget {
  final String mngNo;
  const FavoriteButton({required this.mngNo, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends ConsumerState<FavoriteButton> {
  final UserService userService = UserServiceImpl.instance;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final token = await userService.getToken();
        if (token == null) {
          showCustomBottomSheet(
            context,
            barrierColor: Colors.black.withOpacity(0.4),
            child: RequestLoginSheet(),
          );
        } else {
          // todo. api post
          isFavorite = !isFavorite;
          setState(() {});

          // 즐겨찾기
          final response = await ref.read(
            toggleFavoriteProvider(widget.mngNo).future,
          );

          if (response != null && response.state == "on") {
            // 즐겨찾기 등록
          } else if (response != null && response.state == "off") {
            // 즐겨찾기 해제
          } else {
            // 실패
          }
        }
      },
      child: Image.asset(
        isFavorite ? Images.selectedStarIcon : Images.starIcon,
        width: 24,
      ),
    );
  }
}
