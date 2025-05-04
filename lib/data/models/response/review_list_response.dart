import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_list_response.freezed.dart';
part 'review_list_response.g.dart';

@freezed
class ReviewListResponse with _$ReviewListResponse {
  factory ReviewListResponse({required List<ReviewListItem> favoriteList}) =
      _ReviewListResponse;

  factory ReviewListResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewListResponseFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
class ReviewListItem with _$ReviewListItem {
  factory ReviewListItem({
    required int id,
    required String kakaoId,
    required String code,
    required double score,
    required String content,
    required DateTime reviewDate,
    required DateTime reviewTime,
    required DateTime updateTime,
    required bool isMyReview,
  }) = _ReviewListItem;

  factory ReviewListItem.fromJson(Map<String, dynamic> json) =>
      _$ReviewListItemFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
