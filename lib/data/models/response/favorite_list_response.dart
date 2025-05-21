import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_list_response.freezed.dart';
part 'favorite_list_response.g.dart';

@freezed
class FavoriteListResponse with _$FavoriteListResponse {
  factory FavoriteListResponse({required List<FavoriteListItem> favoriteList}) =
      _FavoriteListResponse;

  factory FavoriteListResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteListResponseFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
class FavoriteListItem with _$FavoriteListItem {
  factory FavoriteListItem({required int id, required String code}) = _FavoriteListItem;

  factory FavoriteListItem.fromJson(Map<String, dynamic> json) => _$FavoriteListItemFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
