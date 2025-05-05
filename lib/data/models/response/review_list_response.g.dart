// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewListResponse _$ReviewListResponseFromJson(Map<String, dynamic> json) =>
    _ReviewListResponse(
      favoriteList: (json['favoriteList'] as List<dynamic>)
          .map(
              (e) => ReviewListItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReviewListResponseToJson(_ReviewListResponse instance) =>
    <String, dynamic>{
      'favoriteList': instance.favoriteList,
    };

_ReviewListItemResponse _$ReviewListItemResponseFromJson(
        Map<String, dynamic> json) =>
    _ReviewListItemResponse(
      id: (json['id'] as num).toInt(),
      kakaoId: json['kakaoId'] as String,
      code: json['code'] as String,
      score: (json['score'] as num).toDouble(),
      content: json['content'] as String,
      reviewDate: DateTime.parse(json['reviewDate'] as String),
      reviewTime: DateTime.parse(json['reviewTime'] as String),
      updateTime: DateTime.parse(json['updateTime'] as String),
      isMyReview: json['isMyReview'] as bool,
    );

Map<String, dynamic> _$ReviewListItemResponseToJson(
        _ReviewListItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kakaoId': instance.kakaoId,
      'code': instance.code,
      'score': instance.score,
      'content': instance.content,
      'reviewDate': instance.reviewDate.toIso8601String(),
      'reviewTime': instance.reviewTime.toIso8601String(),
      'updateTime': instance.updateTime.toIso8601String(),
      'isMyReview': instance.isMyReview,
    };
