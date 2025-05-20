import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/data/datasource/review_api.dart';
import 'package:public_parking_info_fe/data/models/request/review_sort_request.dart';
import 'package:public_parking_info_fe/data/models/response/review_info_response.dart';
import 'package:public_parking_info_fe/data/models/response/review_list_response.dart';

final reviewApiProvider = StateNotifierProvider<ReviewNotifier, AsyncValue<void>>((ref) {
  return ReviewNotifier(AsyncData(null));
});

class ReviewNotifier extends StateNotifier<AsyncValue<void>> {
  final ReviewApi api = ReviewApi.instance;

  ReviewNotifier(super.state);

  Future<ReviewInfoResponse?> getReviewInfo({required String code}) async {
    return await api.getReviewInfo(code);
  }

  Future<bool> reportReview({required int id}) async {
    return await api.reportReview(id);
  }

  Future<List<ReviewListItemResponse>> getReviewList(ReviewSortRequest request) async {
    return await api.getReviewList(request);
  }

  Future<bool> deleteReview({required int id}) async {
    return await api.deleteReview(id);
  }
}

final reviewSortProvider = StateProvider((ref) => "score");
