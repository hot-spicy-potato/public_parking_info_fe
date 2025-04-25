// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ParkingResponse _$ParkingResponseFromJson(Map<String, dynamic> json) =>
    _ParkingResponse(
      page: (json['page'] as num).toInt(),
      perPage: (json['perPage'] as num).toInt(),
      totalCount: (json['totalCount'] as num).toInt(),
      currentCount: (json['currentCount'] as num).toInt(),
      matchCount: (json['matchCount'] as num).toInt(),
      data:
          (json['data'] as List<dynamic>)
              .map((e) => ParkingInfo.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ParkingResponseToJson(_ParkingResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'perPage': instance.perPage,
      'totalCount': instance.totalCount,
      'currentCount': instance.currentCount,
      'matchCount': instance.matchCount,
      'data': instance.data,
    };

_ParkingInfo _$ParkingInfoFromJson(Map<String, dynamic> json) => _ParkingInfo(
  longitude: json['경도'] as String,
  latitude: json['위도'] as String,
  parkingName: json['주차장명'] as String,
  parkingType: json['주차장구분'] as String,
  parkingCategory: json['주차장유형'] as String,
  parkingSpaces: json['주차구획수'] as String,
  feeInfo: json['요금정보'] as String,
  openDays: json['운영요일'] as String,
  managingAgency: json['관리기관명'] as String,
  contact: json['연락처'] as String,
  roadAddress: json['주차장도로명주소'] as String,
  lotNumberAddress: json['주차장지번주소'] as String,
  region: json['지역구분'] as String,
  subRegion: json['지역구분_sub'] as String,
  regionCenterX: json['지역중심좌표(X좌표)'] as String,
  regionCenterY: json['지역중심좌표(Y좌표)'] as String,
  modifiedDate: json['수정일자'] as String,
  parkingId: json['주차장관리번호'] as String,
);

Map<String, dynamic> _$ParkingInfoToJson(_ParkingInfo instance) =>
    <String, dynamic>{
      '경도': instance.longitude,
      '위도': instance.latitude,
      '주차장명': instance.parkingName,
      '주차장구분': instance.parkingType,
      '주차장유형': instance.parkingCategory,
      '주차구획수': instance.parkingSpaces,
      '요금정보': instance.feeInfo,
      '운영요일': instance.openDays,
      '관리기관명': instance.managingAgency,
      '연락처': instance.contact,
      '주차장도로명주소': instance.roadAddress,
      '주차장지번주소': instance.lotNumberAddress,
      '지역구분': instance.region,
      '지역구분_sub': instance.subRegion,
      '지역중심좌표(X좌표)': instance.regionCenterX,
      '지역중심좌표(Y좌표)': instance.regionCenterY,
      '수정일자': instance.modifiedDate,
      '주차장관리번호': instance.parkingId,
    };
