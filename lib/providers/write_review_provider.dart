import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/data/datasource/review_api.dart';
import 'package:public_parking_info_fe/data/models/request/review_request.dart';
import 'package:public_parking_info_fe/services/user_service.dart';

final writeReviewProvider = StateNotifierProvider<WriteReviewNotifier, ReviewRequest>((ref) {
  return WriteReviewNotifier();
});

class WriteReviewNotifier extends StateNotifier<ReviewRequest> {
  WriteReviewNotifier() : super(ReviewRequest.defaultReviewRequest());

  final UserService userService = UserService.instance;
  final ReviewApi api = ReviewApi.instance;

  bool isNotEmpty() {
    return state.code.isNotEmpty && state.content.isNotEmpty;
  }

  void setCode(String code) {
    state = state.copyWith(code: code);
  }

  void setScore(double score) {
    state = state.copyWith(score: score);
  }

  void setContent(String content) {
    state = state.copyWith(content: content);
  }

  void setReviewDate(DateTime date) {
    state = state.copyWith(reviewDate: date);
  }

  void setReviewTime(DateTime time) {
    state = state.copyWith(reviewTime: time);
  }

  Future<void> postReview() async {
    if (isNotEmpty()) {
      await api.postReview(state);
    }
  }
}
