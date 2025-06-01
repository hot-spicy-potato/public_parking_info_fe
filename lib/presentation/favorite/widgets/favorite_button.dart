import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/presentation/common_widgets/custom_bottom_sheet.dart';
import 'package:public_parking_info_fe/presentation/login/widgets/request_login_sheet.dart';
import 'package:public_parking_info_fe/presentation/favorite/providers/favorite_api_provider.dart';
import 'package:public_parking_info_fe/resources/resources.dart';
import 'package:public_parking_info_fe/services/user_service.dart';

class FavoriteButton extends ConsumerStatefulWidget {
  final String mngNo;
  final bool favoriteState;
  const FavoriteButton({required this.mngNo, required this.favoriteState, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends ConsumerState<FavoriteButton> {
  final UserService userService = UserService.instance;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.favoriteState;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final token = await userService.getAccessToken();
        if (token == null) {
          showCustomBottomSheet(
            context,
            barrierColor: Colors.black.withOpacity(0.4),
            child: RequestLoginSheet(),
          );
        } else {
          await ref.read(favoriteApiProvider.notifier).setFavorite(code: widget.mngNo);
          isFavorite = !isFavorite;
          setState(() {});
        }
      },
      child: Image.asset(isFavorite ? Images.selectedStarIcon : Images.starIcon, width: 24),
    );
  }
}
