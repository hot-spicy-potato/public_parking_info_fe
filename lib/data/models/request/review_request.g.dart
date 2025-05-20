// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewRequest _$ReviewRequestFromJson(Map<String, dynamic> json) =>
    _ReviewRequest(
      code: json['code'] as String,
      score: (json['score'] as num).toDouble(),
      content: json['content'] as String,
      reviewDate: DateTime.parse(json['reviewDate'] as String),
      reviewTime: DateTime.parse(json['reviewTime'] as String),
    );

Map<String, dynamic> _$ReviewRequestToJson(_ReviewRequest instance) =>
    <String, dynamic>{
      'code': instance.code,
      'score': instance.score,
      'content': instance.content,
      'reviewDate': instance.reviewDate.toIso8601String(),
      'reviewTime': instance.reviewTime.toIso8601String(),
    };
