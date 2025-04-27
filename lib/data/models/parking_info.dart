// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'parking_info.freezed.dart';
part 'parking_info.g.dart';

@freezed
class ParkingInfo with _$ParkingInfo {
  factory ParkingInfo({
    @JsonKey(name: 'MNG_NO', fromJson: _toInt, defaultValue: -1)
    required int mngNo,
    @JsonKey(name: 'PARKING_NM', fromJson: _toString, defaultValue: "")
    required String parkingNm,
    @JsonKey(name: 'X', fromJson: _toDouble, defaultValue: -1)
    required double x,
    @JsonKey(name: 'Y', fromJson: _toDouble, defaultValue: -1)
    required double y,
    @JsonKey(name: 'GB', fromJson: _toString, defaultValue: "")
    required String gb,
    @JsonKey(name: 'TYPE', fromJson: _toString, defaultValue: "")
    required String type,
    @JsonKey(name: 'JIBUN_ADDR', fromJson: _toString, defaultValue: "")
    required String jibunAddr,
    @JsonKey(name: 'ROAD_ADDR', fromJson: _toString, defaultValue: "")
    required String roadAddr,
    @JsonKey(name: 'PARKING_CNT', fromJson: _toInt, defaultValue: -1)
    required int parkingCnt,
    @JsonKey(name: 'OPER_GB', fromJson: _toString, defaultValue: "")
    required String operGb,
    @JsonKey(name: 'PARKING_FEE', fromJson: _toString, defaultValue: "")
    required String parkingFee,
    @JsonKey(name: 'MNG_AGENCY_NM', fromJson: _toString, defaultValue: "")
    required String mngAgencyNm,
    @JsonKey(name: 'AREA_GB', fromJson: _toString, defaultValue: "")
    required String areaGb,
    @JsonKey(name: 'AREA_GB_SUB', fromJson: _toString, defaultValue: "")
    required String areaGbSub,
    @JsonKey(name: 'LON', fromJson: _toDouble, defaultValue: -1)
    required double lon,
    @JsonKey(name: 'LAT', fromJson: _toDouble, defaultValue: -1)
    required double lat,
    @JsonKey(name: 'ADDR_CD', fromJson: _toInt, defaultValue: -1)
    required int addrCd,
    @JsonKey(name: 'TEL_NO', fromJson: _toString, defaultValue: "")
    required String telNo,
    @JsonKey(name: 'LAST_UPDATE_DT', fromJson: _toString, defaultValue: "")
    required String lastUpdateDt,
  }) = _ParkingInfo;

  factory ParkingInfo.fromJson(Map<String, dynamic> json) =>
      _$ParkingInfoFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

// 변환 함수들
String _toString(dynamic value) {
  if (value == null) return '';
  return value.toString();
}

int _toInt(dynamic value) {
  if (value == null) return -1;
  if (value is int) return value;
  if (value is String) return int.tryParse(value) ?? -1;
  return -1;
}

double _toDouble(dynamic value) {
  if (value == null) return -1;
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? -1;
  return -1;
}
