import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_info_response.freezed.dart';
part 'review_info_response.g.dart';

@freezed
class ReviewInfoResponse with _$ReviewInfoResponse {
  factory ReviewInfoResponse({
    required String code,
    required int total,
    required double score,
    bool? favorite,
  }) = _ReviewInfoResponse;

  factory ReviewInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewInfoResponseFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
