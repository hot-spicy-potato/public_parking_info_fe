import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_filter_request.freezed.dart';
part 'review_filter_request.g.dart';

@freezed
class ReviewFilterRequest with _$ReviewFilterRequest {
  factory ReviewFilterRequest({
    required String mngCd,
    String? sort,
    String? kakaoId,
  }) = _ReviewFilterRequest;

  factory ReviewFilterRequest.fromJson(Map<String, dynamic> json) =>
      _$ReviewFilterRequestFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
