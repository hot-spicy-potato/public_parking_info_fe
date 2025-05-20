import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_request.freezed.dart';
part 'review_request.g.dart';

@freezed
class ReviewRequest with _$ReviewRequest {
  factory ReviewRequest({
    required String code,
    required double score,
    required String content,
    required DateTime reviewDate,
    required DateTime reviewTime,
  }) = _ReviewRequest;

  factory ReviewRequest.fromJson(Map<String, dynamic> json) =>
      _$ReviewRequestFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  static ReviewRequest defaultReviewRequest() {
    return ReviewRequest(
      code: "",
      score: 0,
      content: "",
      reviewDate: DateTime.now(),
      reviewTime: DateTime.now(),
    );
  }
}
