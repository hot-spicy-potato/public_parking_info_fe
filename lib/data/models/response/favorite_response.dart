import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_response.freezed.dart';
part 'favorite_response.g.dart';

@freezed
class FavoriteResponse with _$FavoriteResponse {
  factory FavoriteResponse({required String kakaoId, required String state}) =
      _FavoriteResponse;

  factory FavoriteResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteResponseFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
