// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_filter_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewFilterRequest _$ReviewFilterRequestFromJson(Map<String, dynamic> json) =>
    _ReviewFilterRequest(
      mngCd: json['mngCd'] as String,
      sort: json['sort'] as String?,
      kakaoId: json['kakaoId'] as String?,
    );

Map<String, dynamic> _$ReviewFilterRequestToJson(
        _ReviewFilterRequest instance) =>
    <String, dynamic>{
      'mngCd': instance.mngCd,
      'sort': instance.sort,
      'kakaoId': instance.kakaoId,
    };
