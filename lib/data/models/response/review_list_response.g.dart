// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewListResponse _$ReviewListResponseFromJson(Map<String, dynamic> json) =>
    _ReviewListResponse(
      reviews: (json['reviews'] as List<dynamic>)
          .map(
              (e) => ReviewListItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReviewListResponseToJson(_ReviewListResponse instance) =>
    <String, dynamic>{
      'reviews': instance.reviews,
    };

_ReviewListItemResponse _$ReviewListItemResponseFromJson(
        Map<String, dynamic> json) =>
    _ReviewListItemResponse(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      content: json['content'] as String,
      score: (json['score'] as num).toDouble(),
      reviewDate: DateTime.parse(json['reviewDate'] as String),
      myReview: json['myReview'] as bool,
    );

Map<String, dynamic> _$ReviewListItemResponseToJson(
        _ReviewListItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'content': instance.content,
      'score': instance.score,
      'reviewDate': instance.reviewDate.toIso8601String(),
      'myReview': instance.myReview,
    };
