import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_list_response.freezed.dart';
part 'review_list_response.g.dart';

@freezed
class ReviewListResponse with _$ReviewListResponse {
  factory ReviewListResponse({required List<ReviewListItemResponse> reviews}) =
      _ReviewListResponse;

  factory ReviewListResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewListResponseFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
class ReviewListItemResponse with _$ReviewListItemResponse {
  factory ReviewListItemResponse({
    required int id,
    required String name,
    required String content,
    required double score,
    required DateTime reviewDate,
    required bool myReview,
  }) = _ReviewListItemResponse;

  factory ReviewListItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewListItemResponseFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
