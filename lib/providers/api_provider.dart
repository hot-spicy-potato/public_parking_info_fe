import 'package:public_parking_info_fe/data/datasource/user_api.dart';
import 'package:public_parking_info_fe/data/models/request/review_request.dart';
import 'package:public_parking_info_fe/data/models/response/favorite_list_response.dart';
import 'package:public_parking_info_fe/data/models/response/favorite_response.dart';
import 'package:public_parking_info_fe/data/models/response/review_info_response.dart';
import 'package:public_parking_info_fe/data/models/response/review_list_response.dart';
import 'package:public_parking_info_fe/services/user_service.dart';
import 'package:public_parking_info_fe/services/user_service_impl.dart';
import 'package:riverpod/riverpod.dart';

final userApi = UserApi();
final UserService userService = UserServiceImpl.instance;

final reviewInfoProvider = FutureProvider.family<ReviewInfoResponse?, String>((
  ref,
  mngNo,
) async {
  final String? kakaoId = await userService.getKakaoId();
  if (kakaoId != null) {
    final res = await userApi.getReview(mngNo, kakaoId);
    return res;
  }
  return null;
});

final reviewListProvider =
    FutureProvider.family<ReviewListResponse?, ReviewRequest>((
      ref,
      reviewRequest,
    ) async {
      return await userApi.getReviewList(reviewRequest);
    });

final toggleFavoriteProvider = FutureProviderFamily<FavoriteResponse?, String>((
  ref,
  mngNo,
) async {
  final String? kakaoId = await userService.getKakaoId();
  if (kakaoId != null) {
    return await userApi.postFavorite(mngNo, kakaoId);
  }
  return null;
});

final loginProvider = FutureProviderFamily<String?, String>((
  ref,
  accessToken,
) async {
  return await userApi.login(accessToken);
});

final favoriteListProvider =
    FutureProviderFamily<FavoriteListResponse?, String>((ref, kakaoId) async {
      return await userApi.getFavoriteList(kakaoId);
    });
