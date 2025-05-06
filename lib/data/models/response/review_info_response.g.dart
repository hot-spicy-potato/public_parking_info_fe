// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewInfoResponse _$ReviewInfoResponseFromJson(Map<String, dynamic> json) =>
    _ReviewInfoResponse(
      code: json['code'] as String,
      total: (json['total'] as num).toInt(),
      score: (json['score'] as num).toDouble(),
      favoriteState: json['favoriteState'] as String,
    );

Map<String, dynamic> _$ReviewInfoResponseToJson(_ReviewInfoResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'total': instance.total,
      'score': instance.score,
      'favoriteState': instance.favoriteState,
    };
