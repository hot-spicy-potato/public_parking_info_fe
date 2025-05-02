// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ParkingInfo _$ParkingInfoFromJson(Map<String, dynamic> json) => _ParkingInfo(
      mngNo: json['MNG_NO'] == null ? -1 : _toInt(json['MNG_NO']),
      parkingNm:
          json['PARKING_NM'] == null ? '' : _toString(json['PARKING_NM']),
      x: json['X'] == null ? -1 : _toDouble(json['X']),
      y: json['Y'] == null ? -1 : _toDouble(json['Y']),
      gb: json['GB'] == null ? '' : _toString(json['GB']),
      type: json['TYPE'] == null ? '' : _toString(json['TYPE']),
      jibunAddr:
          json['JIBUN_ADDR'] == null ? '' : _toString(json['JIBUN_ADDR']),
      roadAddr: json['ROAD_ADDR'] == null ? '' : _toString(json['ROAD_ADDR']),
      parkingCnt:
          json['PARKING_CNT'] == null ? -1 : _toInt(json['PARKING_CNT']),
      operGb: json['OPER_GB'] == null ? '' : _toString(json['OPER_GB']),
      parkingFee:
          json['PARKING_FEE'] == null ? '' : _toString(json['PARKING_FEE']),
      mngAgencyNm:
          json['MNG_AGENCY_NM'] == null ? '' : _toString(json['MNG_AGENCY_NM']),
      areaGb: json['AREA_GB'] == null ? '' : _toString(json['AREA_GB']),
      areaGbSub:
          json['AREA_GB_SUB'] == null ? '' : _toString(json['AREA_GB_SUB']),
      lon: json['LON'] == null ? -1 : _toDouble(json['LON']),
      lat: json['LAT'] == null ? -1 : _toDouble(json['LAT']),
      addrCd: json['ADDR_CD'] == null ? -1 : _toInt(json['ADDR_CD']),
      telNo: json['TEL_NO'] == null ? '' : _toString(json['TEL_NO']),
      lastUpdateDt: json['LAST_UPDATE_DT'] == null
          ? ''
          : _toString(json['LAST_UPDATE_DT']),
    );

Map<String, dynamic> _$ParkingInfoToJson(_ParkingInfo instance) =>
    <String, dynamic>{
      'MNG_NO': instance.mngNo,
      'PARKING_NM': instance.parkingNm,
      'X': instance.x,
      'Y': instance.y,
      'GB': instance.gb,
      'TYPE': instance.type,
      'JIBUN_ADDR': instance.jibunAddr,
      'ROAD_ADDR': instance.roadAddr,
      'PARKING_CNT': instance.parkingCnt,
      'OPER_GB': instance.operGb,
      'PARKING_FEE': instance.parkingFee,
      'MNG_AGENCY_NM': instance.mngAgencyNm,
      'AREA_GB': instance.areaGb,
      'AREA_GB_SUB': instance.areaGbSub,
      'LON': instance.lon,
      'LAT': instance.lat,
      'ADDR_CD': instance.addrCd,
      'TEL_NO': instance.telNo,
      'LAST_UPDATE_DT': instance.lastUpdateDt,
    };
