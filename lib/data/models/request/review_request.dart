import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_request.freezed.dart';
part 'review_request.g.dart';

@freezed
class ReviewRequest with _$ReviewRequest {
  factory ReviewRequest({required String mngCd, required String sort}) =
      _ReviewRequest;

  factory ReviewRequest.fromJson(Map<String, dynamic> json) =>
      _$ReviewRequestFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
