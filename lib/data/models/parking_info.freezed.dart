// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parking_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ParkingInfo {
  @JsonKey(name: 'MNG_NO', fromJson: _toInt, defaultValue: -1)
  int get mngNo;
  @JsonKey(name: 'PARKING_NM', fromJson: _toString, defaultValue: "")
  String get parkingNm;
  @JsonKey(name: 'X', fromJson: _toDouble, defaultValue: -1)
  double get x;
  @JsonKey(name: 'Y', fromJson: _toDouble, defaultValue: -1)
  double get y;
  @JsonKey(name: 'GB', fromJson: _toString, defaultValue: "")
  String get gb;
  @JsonKey(name: 'TYPE', fromJson: _toString, defaultValue: "")
  String get type;
  @JsonKey(name: 'JIBUN_ADDR', fromJson: _toString, defaultValue: "")
  String get jibunAddr;
  @JsonKey(name: 'ROAD_ADDR', fromJson: _toString, defaultValue: "")
  String get roadAddr;
  @JsonKey(name: 'PARKING_CNT', fromJson: _toInt, defaultValue: -1)
  int get parkingCnt;
  @JsonKey(name: 'OPER_GB', fromJson: _toString, defaultValue: "")
  String get operGb;
  @JsonKey(name: 'PARKING_FEE', fromJson: _toString, defaultValue: "")
  String get parkingFee;
  @JsonKey(name: 'MNG_AGENCY_NM', fromJson: _toString, defaultValue: "")
  String get mngAgencyNm;
  @JsonKey(name: 'AREA_GB', fromJson: _toString, defaultValue: "")
  String get areaGb;
  @JsonKey(name: 'AREA_GB_SUB', fromJson: _toString, defaultValue: "")
  String get areaGbSub;
  @JsonKey(name: 'LON', fromJson: _toDouble, defaultValue: -1)
  double get lon;
  @JsonKey(name: 'LAT', fromJson: _toDouble, defaultValue: -1)
  double get lat;
  @JsonKey(name: 'ADDR_CD', fromJson: _toInt, defaultValue: -1)
  int get addrCd;
  @JsonKey(name: 'TEL_NO', fromJson: _toString, defaultValue: "")
  String get telNo;
  @JsonKey(name: 'LAST_UPDATE_DT', fromJson: _toString, defaultValue: "")
  String get lastUpdateDt;

  /// Create a copy of ParkingInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ParkingInfoCopyWith<ParkingInfo> get copyWith =>
      _$ParkingInfoCopyWithImpl<ParkingInfo>(this as ParkingInfo, _$identity);

  /// Serializes this ParkingInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ParkingInfo &&
            (identical(other.mngNo, mngNo) || other.mngNo == mngNo) &&
            (identical(other.parkingNm, parkingNm) ||
                other.parkingNm == parkingNm) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.gb, gb) || other.gb == gb) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.jibunAddr, jibunAddr) ||
                other.jibunAddr == jibunAddr) &&
            (identical(other.roadAddr, roadAddr) ||
                other.roadAddr == roadAddr) &&
            (identical(other.parkingCnt, parkingCnt) ||
                other.parkingCnt == parkingCnt) &&
            (identical(other.operGb, operGb) || other.operGb == operGb) &&
            (identical(other.parkingFee, parkingFee) ||
                other.parkingFee == parkingFee) &&
            (identical(other.mngAgencyNm, mngAgencyNm) ||
                other.mngAgencyNm == mngAgencyNm) &&
            (identical(other.areaGb, areaGb) || other.areaGb == areaGb) &&
            (identical(other.areaGbSub, areaGbSub) ||
                other.areaGbSub == areaGbSub) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.addrCd, addrCd) || other.addrCd == addrCd) &&
            (identical(other.telNo, telNo) || other.telNo == telNo) &&
            (identical(other.lastUpdateDt, lastUpdateDt) ||
                other.lastUpdateDt == lastUpdateDt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        mngNo,
        parkingNm,
        x,
        y,
        gb,
        type,
        jibunAddr,
        roadAddr,
        parkingCnt,
        operGb,
        parkingFee,
        mngAgencyNm,
        areaGb,
        areaGbSub,
        lon,
        lat,
        addrCd,
        telNo,
        lastUpdateDt
      ]);

  @override
  String toString() {
    return 'ParkingInfo(mngNo: $mngNo, parkingNm: $parkingNm, x: $x, y: $y, gb: $gb, type: $type, jibunAddr: $jibunAddr, roadAddr: $roadAddr, parkingCnt: $parkingCnt, operGb: $operGb, parkingFee: $parkingFee, mngAgencyNm: $mngAgencyNm, areaGb: $areaGb, areaGbSub: $areaGbSub, lon: $lon, lat: $lat, addrCd: $addrCd, telNo: $telNo, lastUpdateDt: $lastUpdateDt)';
  }
}

/// @nodoc
abstract mixin class $ParkingInfoCopyWith<$Res> {
  factory $ParkingInfoCopyWith(
          ParkingInfo value, $Res Function(ParkingInfo) _then) =
      _$ParkingInfoCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'MNG_NO', fromJson: _toInt, defaultValue: -1) int mngNo,
      @JsonKey(name: 'PARKING_NM', fromJson: _toString, defaultValue: "")
      String parkingNm,
      @JsonKey(name: 'X', fromJson: _toDouble, defaultValue: -1) double x,
      @JsonKey(name: 'Y', fromJson: _toDouble, defaultValue: -1) double y,
      @JsonKey(name: 'GB', fromJson: _toString, defaultValue: "") String gb,
      @JsonKey(name: 'TYPE', fromJson: _toString, defaultValue: "") String type,
      @JsonKey(name: 'JIBUN_ADDR', fromJson: _toString, defaultValue: "")
      String jibunAddr,
      @JsonKey(name: 'ROAD_ADDR', fromJson: _toString, defaultValue: "")
      String roadAddr,
      @JsonKey(name: 'PARKING_CNT', fromJson: _toInt, defaultValue: -1)
      int parkingCnt,
      @JsonKey(name: 'OPER_GB', fromJson: _toString, defaultValue: "")
      String operGb,
      @JsonKey(name: 'PARKING_FEE', fromJson: _toString, defaultValue: "")
      String parkingFee,
      @JsonKey(name: 'MNG_AGENCY_NM', fromJson: _toString, defaultValue: "")
      String mngAgencyNm,
      @JsonKey(name: 'AREA_GB', fromJson: _toString, defaultValue: "")
      String areaGb,
      @JsonKey(name: 'AREA_GB_SUB', fromJson: _toString, defaultValue: "")
      String areaGbSub,
      @JsonKey(name: 'LON', fromJson: _toDouble, defaultValue: -1) double lon,
      @JsonKey(name: 'LAT', fromJson: _toDouble, defaultValue: -1) double lat,
      @JsonKey(name: 'ADDR_CD', fromJson: _toInt, defaultValue: -1) int addrCd,
      @JsonKey(name: 'TEL_NO', fromJson: _toString, defaultValue: "")
      String telNo,
      @JsonKey(name: 'LAST_UPDATE_DT', fromJson: _toString, defaultValue: "")
      String lastUpdateDt});
}

/// @nodoc
class _$ParkingInfoCopyWithImpl<$Res> implements $ParkingInfoCopyWith<$Res> {
  _$ParkingInfoCopyWithImpl(this._self, this._then);

  final ParkingInfo _self;
  final $Res Function(ParkingInfo) _then;

  /// Create a copy of ParkingInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mngNo = null,
    Object? parkingNm = null,
    Object? x = null,
    Object? y = null,
    Object? gb = null,
    Object? type = null,
    Object? jibunAddr = null,
    Object? roadAddr = null,
    Object? parkingCnt = null,
    Object? operGb = null,
    Object? parkingFee = null,
    Object? mngAgencyNm = null,
    Object? areaGb = null,
    Object? areaGbSub = null,
    Object? lon = null,
    Object? lat = null,
    Object? addrCd = null,
    Object? telNo = null,
    Object? lastUpdateDt = null,
  }) {
    return _then(_self.copyWith(
      mngNo: null == mngNo
          ? _self.mngNo
          : mngNo // ignore: cast_nullable_to_non_nullable
              as int,
      parkingNm: null == parkingNm
          ? _self.parkingNm
          : parkingNm // ignore: cast_nullable_to_non_nullable
              as String,
      x: null == x
          ? _self.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _self.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      gb: null == gb
          ? _self.gb
          : gb // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      jibunAddr: null == jibunAddr
          ? _self.jibunAddr
          : jibunAddr // ignore: cast_nullable_to_non_nullable
              as String,
      roadAddr: null == roadAddr
          ? _self.roadAddr
          : roadAddr // ignore: cast_nullable_to_non_nullable
              as String,
      parkingCnt: null == parkingCnt
          ? _self.parkingCnt
          : parkingCnt // ignore: cast_nullable_to_non_nullable
              as int,
      operGb: null == operGb
          ? _self.operGb
          : operGb // ignore: cast_nullable_to_non_nullable
              as String,
      parkingFee: null == parkingFee
          ? _self.parkingFee
          : parkingFee // ignore: cast_nullable_to_non_nullable
              as String,
      mngAgencyNm: null == mngAgencyNm
          ? _self.mngAgencyNm
          : mngAgencyNm // ignore: cast_nullable_to_non_nullable
              as String,
      areaGb: null == areaGb
          ? _self.areaGb
          : areaGb // ignore: cast_nullable_to_non_nullable
              as String,
      areaGbSub: null == areaGbSub
          ? _self.areaGbSub
          : areaGbSub // ignore: cast_nullable_to_non_nullable
              as String,
      lon: null == lon
          ? _self.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      addrCd: null == addrCd
          ? _self.addrCd
          : addrCd // ignore: cast_nullable_to_non_nullable
              as int,
      telNo: null == telNo
          ? _self.telNo
          : telNo // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdateDt: null == lastUpdateDt
          ? _self.lastUpdateDt
          : lastUpdateDt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ParkingInfo implements ParkingInfo {
  _ParkingInfo(
      {@JsonKey(name: 'MNG_NO', fromJson: _toInt, defaultValue: -1)
      required this.mngNo,
      @JsonKey(name: 'PARKING_NM', fromJson: _toString, defaultValue: "")
      required this.parkingNm,
      @JsonKey(name: 'X', fromJson: _toDouble, defaultValue: -1)
      required this.x,
      @JsonKey(name: 'Y', fromJson: _toDouble, defaultValue: -1)
      required this.y,
      @JsonKey(name: 'GB', fromJson: _toString, defaultValue: "")
      required this.gb,
      @JsonKey(name: 'TYPE', fromJson: _toString, defaultValue: "")
      required this.type,
      @JsonKey(name: 'JIBUN_ADDR', fromJson: _toString, defaultValue: "")
      required this.jibunAddr,
      @JsonKey(name: 'ROAD_ADDR', fromJson: _toString, defaultValue: "")
      required this.roadAddr,
      @JsonKey(name: 'PARKING_CNT', fromJson: _toInt, defaultValue: -1)
      required this.parkingCnt,
      @JsonKey(name: 'OPER_GB', fromJson: _toString, defaultValue: "")
      required this.operGb,
      @JsonKey(name: 'PARKING_FEE', fromJson: _toString, defaultValue: "")
      required this.parkingFee,
      @JsonKey(name: 'MNG_AGENCY_NM', fromJson: _toString, defaultValue: "")
      required this.mngAgencyNm,
      @JsonKey(name: 'AREA_GB', fromJson: _toString, defaultValue: "")
      required this.areaGb,
      @JsonKey(name: 'AREA_GB_SUB', fromJson: _toString, defaultValue: "")
      required this.areaGbSub,
      @JsonKey(name: 'LON', fromJson: _toDouble, defaultValue: -1)
      required this.lon,
      @JsonKey(name: 'LAT', fromJson: _toDouble, defaultValue: -1)
      required this.lat,
      @JsonKey(name: 'ADDR_CD', fromJson: _toInt, defaultValue: -1)
      required this.addrCd,
      @JsonKey(name: 'TEL_NO', fromJson: _toString, defaultValue: "")
      required this.telNo,
      @JsonKey(name: 'LAST_UPDATE_DT', fromJson: _toString, defaultValue: "")
      required this.lastUpdateDt});
  factory _ParkingInfo.fromJson(Map<String, dynamic> json) =>
      _$ParkingInfoFromJson(json);

  @override
  @JsonKey(name: 'MNG_NO', fromJson: _toInt, defaultValue: -1)
  final int mngNo;
  @override
  @JsonKey(name: 'PARKING_NM', fromJson: _toString, defaultValue: "")
  final String parkingNm;
  @override
  @JsonKey(name: 'X', fromJson: _toDouble, defaultValue: -1)
  final double x;
  @override
  @JsonKey(name: 'Y', fromJson: _toDouble, defaultValue: -1)
  final double y;
  @override
  @JsonKey(name: 'GB', fromJson: _toString, defaultValue: "")
  final String gb;
  @override
  @JsonKey(name: 'TYPE', fromJson: _toString, defaultValue: "")
  final String type;
  @override
  @JsonKey(name: 'JIBUN_ADDR', fromJson: _toString, defaultValue: "")
  final String jibunAddr;
  @override
  @JsonKey(name: 'ROAD_ADDR', fromJson: _toString, defaultValue: "")
  final String roadAddr;
  @override
  @JsonKey(name: 'PARKING_CNT', fromJson: _toInt, defaultValue: -1)
  final int parkingCnt;
  @override
  @JsonKey(name: 'OPER_GB', fromJson: _toString, defaultValue: "")
  final String operGb;
  @override
  @JsonKey(name: 'PARKING_FEE', fromJson: _toString, defaultValue: "")
  final String parkingFee;
  @override
  @JsonKey(name: 'MNG_AGENCY_NM', fromJson: _toString, defaultValue: "")
  final String mngAgencyNm;
  @override
  @JsonKey(name: 'AREA_GB', fromJson: _toString, defaultValue: "")
  final String areaGb;
  @override
  @JsonKey(name: 'AREA_GB_SUB', fromJson: _toString, defaultValue: "")
  final String areaGbSub;
  @override
  @JsonKey(name: 'LON', fromJson: _toDouble, defaultValue: -1)
  final double lon;
  @override
  @JsonKey(name: 'LAT', fromJson: _toDouble, defaultValue: -1)
  final double lat;
  @override
  @JsonKey(name: 'ADDR_CD', fromJson: _toInt, defaultValue: -1)
  final int addrCd;
  @override
  @JsonKey(name: 'TEL_NO', fromJson: _toString, defaultValue: "")
  final String telNo;
  @override
  @JsonKey(name: 'LAST_UPDATE_DT', fromJson: _toString, defaultValue: "")
  final String lastUpdateDt;

  /// Create a copy of ParkingInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ParkingInfoCopyWith<_ParkingInfo> get copyWith =>
      __$ParkingInfoCopyWithImpl<_ParkingInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ParkingInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ParkingInfo &&
            (identical(other.mngNo, mngNo) || other.mngNo == mngNo) &&
            (identical(other.parkingNm, parkingNm) ||
                other.parkingNm == parkingNm) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.gb, gb) || other.gb == gb) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.jibunAddr, jibunAddr) ||
                other.jibunAddr == jibunAddr) &&
            (identical(other.roadAddr, roadAddr) ||
                other.roadAddr == roadAddr) &&
            (identical(other.parkingCnt, parkingCnt) ||
                other.parkingCnt == parkingCnt) &&
            (identical(other.operGb, operGb) || other.operGb == operGb) &&
            (identical(other.parkingFee, parkingFee) ||
                other.parkingFee == parkingFee) &&
            (identical(other.mngAgencyNm, mngAgencyNm) ||
                other.mngAgencyNm == mngAgencyNm) &&
            (identical(other.areaGb, areaGb) || other.areaGb == areaGb) &&
            (identical(other.areaGbSub, areaGbSub) ||
                other.areaGbSub == areaGbSub) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.addrCd, addrCd) || other.addrCd == addrCd) &&
            (identical(other.telNo, telNo) || other.telNo == telNo) &&
            (identical(other.lastUpdateDt, lastUpdateDt) ||
                other.lastUpdateDt == lastUpdateDt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        mngNo,
        parkingNm,
        x,
        y,
        gb,
        type,
        jibunAddr,
        roadAddr,
        parkingCnt,
        operGb,
        parkingFee,
        mngAgencyNm,
        areaGb,
        areaGbSub,
        lon,
        lat,
        addrCd,
        telNo,
        lastUpdateDt
      ]);

  @override
  String toString() {
    return 'ParkingInfo(mngNo: $mngNo, parkingNm: $parkingNm, x: $x, y: $y, gb: $gb, type: $type, jibunAddr: $jibunAddr, roadAddr: $roadAddr, parkingCnt: $parkingCnt, operGb: $operGb, parkingFee: $parkingFee, mngAgencyNm: $mngAgencyNm, areaGb: $areaGb, areaGbSub: $areaGbSub, lon: $lon, lat: $lat, addrCd: $addrCd, telNo: $telNo, lastUpdateDt: $lastUpdateDt)';
  }
}

/// @nodoc
abstract mixin class _$ParkingInfoCopyWith<$Res>
    implements $ParkingInfoCopyWith<$Res> {
  factory _$ParkingInfoCopyWith(
          _ParkingInfo value, $Res Function(_ParkingInfo) _then) =
      __$ParkingInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'MNG_NO', fromJson: _toInt, defaultValue: -1) int mngNo,
      @JsonKey(name: 'PARKING_NM', fromJson: _toString, defaultValue: "")
      String parkingNm,
      @JsonKey(name: 'X', fromJson: _toDouble, defaultValue: -1) double x,
      @JsonKey(name: 'Y', fromJson: _toDouble, defaultValue: -1) double y,
      @JsonKey(name: 'GB', fromJson: _toString, defaultValue: "") String gb,
      @JsonKey(name: 'TYPE', fromJson: _toString, defaultValue: "") String type,
      @JsonKey(name: 'JIBUN_ADDR', fromJson: _toString, defaultValue: "")
      String jibunAddr,
      @JsonKey(name: 'ROAD_ADDR', fromJson: _toString, defaultValue: "")
      String roadAddr,
      @JsonKey(name: 'PARKING_CNT', fromJson: _toInt, defaultValue: -1)
      int parkingCnt,
      @JsonKey(name: 'OPER_GB', fromJson: _toString, defaultValue: "")
      String operGb,
      @JsonKey(name: 'PARKING_FEE', fromJson: _toString, defaultValue: "")
      String parkingFee,
      @JsonKey(name: 'MNG_AGENCY_NM', fromJson: _toString, defaultValue: "")
      String mngAgencyNm,
      @JsonKey(name: 'AREA_GB', fromJson: _toString, defaultValue: "")
      String areaGb,
      @JsonKey(name: 'AREA_GB_SUB', fromJson: _toString, defaultValue: "")
      String areaGbSub,
      @JsonKey(name: 'LON', fromJson: _toDouble, defaultValue: -1) double lon,
      @JsonKey(name: 'LAT', fromJson: _toDouble, defaultValue: -1) double lat,
      @JsonKey(name: 'ADDR_CD', fromJson: _toInt, defaultValue: -1) int addrCd,
      @JsonKey(name: 'TEL_NO', fromJson: _toString, defaultValue: "")
      String telNo,
      @JsonKey(name: 'LAST_UPDATE_DT', fromJson: _toString, defaultValue: "")
      String lastUpdateDt});
}

/// @nodoc
class __$ParkingInfoCopyWithImpl<$Res> implements _$ParkingInfoCopyWith<$Res> {
  __$ParkingInfoCopyWithImpl(this._self, this._then);

  final _ParkingInfo _self;
  final $Res Function(_ParkingInfo) _then;

  /// Create a copy of ParkingInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? mngNo = null,
    Object? parkingNm = null,
    Object? x = null,
    Object? y = null,
    Object? gb = null,
    Object? type = null,
    Object? jibunAddr = null,
    Object? roadAddr = null,
    Object? parkingCnt = null,
    Object? operGb = null,
    Object? parkingFee = null,
    Object? mngAgencyNm = null,
    Object? areaGb = null,
    Object? areaGbSub = null,
    Object? lon = null,
    Object? lat = null,
    Object? addrCd = null,
    Object? telNo = null,
    Object? lastUpdateDt = null,
  }) {
    return _then(_ParkingInfo(
      mngNo: null == mngNo
          ? _self.mngNo
          : mngNo // ignore: cast_nullable_to_non_nullable
              as int,
      parkingNm: null == parkingNm
          ? _self.parkingNm
          : parkingNm // ignore: cast_nullable_to_non_nullable
              as String,
      x: null == x
          ? _self.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _self.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      gb: null == gb
          ? _self.gb
          : gb // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      jibunAddr: null == jibunAddr
          ? _self.jibunAddr
          : jibunAddr // ignore: cast_nullable_to_non_nullable
              as String,
      roadAddr: null == roadAddr
          ? _self.roadAddr
          : roadAddr // ignore: cast_nullable_to_non_nullable
              as String,
      parkingCnt: null == parkingCnt
          ? _self.parkingCnt
          : parkingCnt // ignore: cast_nullable_to_non_nullable
              as int,
      operGb: null == operGb
          ? _self.operGb
          : operGb // ignore: cast_nullable_to_non_nullable
              as String,
      parkingFee: null == parkingFee
          ? _self.parkingFee
          : parkingFee // ignore: cast_nullable_to_non_nullable
              as String,
      mngAgencyNm: null == mngAgencyNm
          ? _self.mngAgencyNm
          : mngAgencyNm // ignore: cast_nullable_to_non_nullable
              as String,
      areaGb: null == areaGb
          ? _self.areaGb
          : areaGb // ignore: cast_nullable_to_non_nullable
              as String,
      areaGbSub: null == areaGbSub
          ? _self.areaGbSub
          : areaGbSub // ignore: cast_nullable_to_non_nullable
              as String,
      lon: null == lon
          ? _self.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      addrCd: null == addrCd
          ? _self.addrCd
          : addrCd // ignore: cast_nullable_to_non_nullable
              as int,
      telNo: null == telNo
          ? _self.telNo
          : telNo // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdateDt: null == lastUpdateDt
          ? _self.lastUpdateDt
          : lastUpdateDt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
