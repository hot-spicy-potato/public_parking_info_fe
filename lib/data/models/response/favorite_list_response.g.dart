// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FavoriteListResponse _$FavoriteListResponseFromJson(
        Map<String, dynamic> json) =>
    _FavoriteListResponse(
      favoriteList: (json['favoriteList'] as List<dynamic>)
          .map((e) => FavoriteListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FavoriteListResponseToJson(
        _FavoriteListResponse instance) =>
    <String, dynamic>{
      'favoriteList': instance.favoriteList,
    };

_FavoriteListItem _$FavoriteListItemFromJson(Map<String, dynamic> json) =>
    _FavoriteListItem(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
    );

Map<String, dynamic> _$FavoriteListItemToJson(_FavoriteListItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
    };
