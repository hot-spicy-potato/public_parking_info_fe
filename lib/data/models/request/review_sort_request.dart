import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_sort_request.freezed.dart';
part 'review_sort_request.g.dart';

@freezed
class ReviewSortRequest with _$ReviewSortRequest {
  factory ReviewSortRequest({required String code, String? sort}) =
      _ReviewSortRequest;

  factory ReviewSortRequest.fromJson(Map<String, dynamic> json) =>
      _$ReviewSortRequestFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
