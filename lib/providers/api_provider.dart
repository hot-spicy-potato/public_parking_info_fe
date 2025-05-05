import 'package:public_parking_info_fe/data/datasource/user_api.dart';
import 'package:public_parking_info_fe/data/models/request/review_request.dart';
import 'package:public_parking_info_fe/data/models/response/favorite_response.dart';
import 'package:public_parking_info_fe/data/models/response/review_info_response.dart';
import 'package:public_parking_info_fe/data/models/response/review_list_response.dart';
import 'package:riverpod/riverpod.dart';

final userApi = UserApi();

final reviewInfoProvider = FutureProvider.family<ReviewInfoResponse?, String>((
  ref,
  mngNo,
) async {
  return await userApi.getReview(mngNo);
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
  return await userApi.postFavorite(mngNo);
});
