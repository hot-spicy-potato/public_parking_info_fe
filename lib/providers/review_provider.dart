import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/data/datasource/user_api.dart';
import 'package:public_parking_info_fe/data/models/request/review_request.dart';
import 'package:public_parking_info_fe/services/user_service.dart';
import 'package:public_parking_info_fe/services/user_service_impl.dart';

final reviewProvider = StateNotifierProvider<ReviewNotifier, ReviewRequest>(
  (ref) => ReviewNotifier(),
);

class ReviewNotifier extends StateNotifier<ReviewRequest> {
  ReviewNotifier() : super(ReviewRequest.defaultReviewRequest());

  final UserService userService = UserServiceImpl.instance;
  final userApi = UserApi();

  Future<void> setKakaoId() async {
    final String? kakaoId = await userService.getKakaoId();
    if (kakaoId != null) {
      state = state.copyWith(kakaoId: kakaoId);
    }
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

  bool isNotEmpty() {
    return state.code.isNotEmpty &&
        state.content.isNotEmpty &&
        state.kakaoId.isNotEmpty;
  }

  Future<void> postReview() async {
    if (isNotEmpty()) {
      final res = await userApi.postReviewAPI(state);
      print("post review : $res");
    }
  }
}
