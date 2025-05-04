// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewRequest _$ReviewRequestFromJson(Map<String, dynamic> json) =>
    _ReviewRequest(
      id: (json['id'] as num).toInt(),
      kakaoId: json['kakaoId'] as String,
      code: json['code'] as String,
      score: (json['score'] as num).toDouble(),
      content: json['content'] as String,
      reviewDate: DateTime.parse(json['reviewDate'] as String),
      reviewtime: DateTime.parse(json['reviewtime'] as String),
      updateTime: DateTime.parse(json['updateTime'] as String),
    );

Map<String, dynamic> _$ReviewRequestToJson(_ReviewRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kakaoId': instance.kakaoId,
      'code': instance.code,
      'score': instance.score,
      'content': instance.content,
      'reviewDate': instance.reviewDate.toIso8601String(),
      'reviewtime': instance.reviewtime.toIso8601String(),
      'updateTime': instance.updateTime.toIso8601String(),
    };
