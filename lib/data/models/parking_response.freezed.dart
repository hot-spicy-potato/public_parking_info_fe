// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parking_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ParkingResponse {

 int get page; int get perPage; int get totalCount; int get currentCount; int get matchCount; List<ParkingInfo> get data;
/// Create a copy of ParkingResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParkingResponseCopyWith<ParkingResponse> get copyWith => _$ParkingResponseCopyWithImpl<ParkingResponse>(this as ParkingResponse, _$identity);

  /// Serializes this ParkingResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParkingResponse&&(identical(other.page, page) || other.page == page)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.currentCount, currentCount) || other.currentCount == currentCount)&&(identical(other.matchCount, matchCount) || other.matchCount == matchCount)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,perPage,totalCount,currentCount,matchCount,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ParkingResponse(page: $page, perPage: $perPage, totalCount: $totalCount, currentCount: $currentCount, matchCount: $matchCount, data: $data)';
}


}

/// @nodoc
abstract mixin class $ParkingResponseCopyWith<$Res>  {
  factory $ParkingResponseCopyWith(ParkingResponse value, $Res Function(ParkingResponse) _then) = _$ParkingResponseCopyWithImpl;
@useResult
$Res call({
 int page, int perPage, int totalCount, int currentCount, int matchCount, List<ParkingInfo> data
});




}
/// @nodoc
class _$ParkingResponseCopyWithImpl<$Res>
    implements $ParkingResponseCopyWith<$Res> {
  _$ParkingResponseCopyWithImpl(this._self, this._then);

  final ParkingResponse _self;
  final $Res Function(ParkingResponse) _then;

/// Create a copy of ParkingResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? perPage = null,Object? totalCount = null,Object? currentCount = null,Object? matchCount = null,Object? data = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,currentCount: null == currentCount ? _self.currentCount : currentCount // ignore: cast_nullable_to_non_nullable
as int,matchCount: null == matchCount ? _self.matchCount : matchCount // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<ParkingInfo>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ParkingResponse implements ParkingResponse {
   _ParkingResponse({required this.page, required this.perPage, required this.totalCount, required this.currentCount, required this.matchCount, required final  List<ParkingInfo> data}): _data = data;
  factory _ParkingResponse.fromJson(Map<String, dynamic> json) => _$ParkingResponseFromJson(json);

@override final  int page;
@override final  int perPage;
@override final  int totalCount;
@override final  int currentCount;
@override final  int matchCount;
 final  List<ParkingInfo> _data;
@override List<ParkingInfo> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of ParkingResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParkingResponseCopyWith<_ParkingResponse> get copyWith => __$ParkingResponseCopyWithImpl<_ParkingResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParkingResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParkingResponse&&(identical(other.page, page) || other.page == page)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.currentCount, currentCount) || other.currentCount == currentCount)&&(identical(other.matchCount, matchCount) || other.matchCount == matchCount)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,perPage,totalCount,currentCount,matchCount,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'ParkingResponse(page: $page, perPage: $perPage, totalCount: $totalCount, currentCount: $currentCount, matchCount: $matchCount, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ParkingResponseCopyWith<$Res> implements $ParkingResponseCopyWith<$Res> {
  factory _$ParkingResponseCopyWith(_ParkingResponse value, $Res Function(_ParkingResponse) _then) = __$ParkingResponseCopyWithImpl;
@override @useResult
$Res call({
 int page, int perPage, int totalCount, int currentCount, int matchCount, List<ParkingInfo> data
});




}
/// @nodoc
class __$ParkingResponseCopyWithImpl<$Res>
    implements _$ParkingResponseCopyWith<$Res> {
  __$ParkingResponseCopyWithImpl(this._self, this._then);

  final _ParkingResponse _self;
  final $Res Function(_ParkingResponse) _then;

/// Create a copy of ParkingResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? perPage = null,Object? totalCount = null,Object? currentCount = null,Object? matchCount = null,Object? data = null,}) {
  return _then(_ParkingResponse(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,currentCount: null == currentCount ? _self.currentCount : currentCount // ignore: cast_nullable_to_non_nullable
as int,matchCount: null == matchCount ? _self.matchCount : matchCount // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<ParkingInfo>,
  ));
}


}


/// @nodoc
mixin _$ParkingInfo {

@JsonKey(name: '경도') String get longitude;@JsonKey(name: '위도') String get latitude;@JsonKey(name: '주차장명') String get parkingName;@JsonKey(name: '주차장구분') String get parkingType;@JsonKey(name: '주차장유형') String get parkingCategory;@JsonKey(name: '주차구획수') String get parkingSpaces;@JsonKey(name: '요금정보') String get feeInfo;@JsonKey(name: '운영요일') String get openDays;@JsonKey(name: '관리기관명') String get managingAgency;@JsonKey(name: '연락처') String get contact;@JsonKey(name: '주차장도로명주소') String get roadAddress;@JsonKey(name: '주차장지번주소') String get lotNumberAddress;@JsonKey(name: '지역구분') String get region;@JsonKey(name: '지역구분_sub') String get subRegion;@JsonKey(name: '지역중심좌표(X좌표)') String get regionCenterX;@JsonKey(name: '지역중심좌표(Y좌표)') String get regionCenterY;@JsonKey(name: '수정일자') String get modifiedDate;@JsonKey(name: '주차장관리번호') String get parkingId;
/// Create a copy of ParkingInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParkingInfoCopyWith<ParkingInfo> get copyWith => _$ParkingInfoCopyWithImpl<ParkingInfo>(this as ParkingInfo, _$identity);

  /// Serializes this ParkingInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParkingInfo&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.parkingName, parkingName) || other.parkingName == parkingName)&&(identical(other.parkingType, parkingType) || other.parkingType == parkingType)&&(identical(other.parkingCategory, parkingCategory) || other.parkingCategory == parkingCategory)&&(identical(other.parkingSpaces, parkingSpaces) || other.parkingSpaces == parkingSpaces)&&(identical(other.feeInfo, feeInfo) || other.feeInfo == feeInfo)&&(identical(other.openDays, openDays) || other.openDays == openDays)&&(identical(other.managingAgency, managingAgency) || other.managingAgency == managingAgency)&&(identical(other.contact, contact) || other.contact == contact)&&(identical(other.roadAddress, roadAddress) || other.roadAddress == roadAddress)&&(identical(other.lotNumberAddress, lotNumberAddress) || other.lotNumberAddress == lotNumberAddress)&&(identical(other.region, region) || other.region == region)&&(identical(other.subRegion, subRegion) || other.subRegion == subRegion)&&(identical(other.regionCenterX, regionCenterX) || other.regionCenterX == regionCenterX)&&(identical(other.regionCenterY, regionCenterY) || other.regionCenterY == regionCenterY)&&(identical(other.modifiedDate, modifiedDate) || other.modifiedDate == modifiedDate)&&(identical(other.parkingId, parkingId) || other.parkingId == parkingId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,longitude,latitude,parkingName,parkingType,parkingCategory,parkingSpaces,feeInfo,openDays,managingAgency,contact,roadAddress,lotNumberAddress,region,subRegion,regionCenterX,regionCenterY,modifiedDate,parkingId);

@override
String toString() {
  return 'ParkingInfo(longitude: $longitude, latitude: $latitude, parkingName: $parkingName, parkingType: $parkingType, parkingCategory: $parkingCategory, parkingSpaces: $parkingSpaces, feeInfo: $feeInfo, openDays: $openDays, managingAgency: $managingAgency, contact: $contact, roadAddress: $roadAddress, lotNumberAddress: $lotNumberAddress, region: $region, subRegion: $subRegion, regionCenterX: $regionCenterX, regionCenterY: $regionCenterY, modifiedDate: $modifiedDate, parkingId: $parkingId)';
}


}

/// @nodoc
abstract mixin class $ParkingInfoCopyWith<$Res>  {
  factory $ParkingInfoCopyWith(ParkingInfo value, $Res Function(ParkingInfo) _then) = _$ParkingInfoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '경도') String longitude,@JsonKey(name: '위도') String latitude,@JsonKey(name: '주차장명') String parkingName,@JsonKey(name: '주차장구분') String parkingType,@JsonKey(name: '주차장유형') String parkingCategory,@JsonKey(name: '주차구획수') String parkingSpaces,@JsonKey(name: '요금정보') String feeInfo,@JsonKey(name: '운영요일') String openDays,@JsonKey(name: '관리기관명') String managingAgency,@JsonKey(name: '연락처') String contact,@JsonKey(name: '주차장도로명주소') String roadAddress,@JsonKey(name: '주차장지번주소') String lotNumberAddress,@JsonKey(name: '지역구분') String region,@JsonKey(name: '지역구분_sub') String subRegion,@JsonKey(name: '지역중심좌표(X좌표)') String regionCenterX,@JsonKey(name: '지역중심좌표(Y좌표)') String regionCenterY,@JsonKey(name: '수정일자') String modifiedDate,@JsonKey(name: '주차장관리번호') String parkingId
});




}
/// @nodoc
class _$ParkingInfoCopyWithImpl<$Res>
    implements $ParkingInfoCopyWith<$Res> {
  _$ParkingInfoCopyWithImpl(this._self, this._then);

  final ParkingInfo _self;
  final $Res Function(ParkingInfo) _then;

/// Create a copy of ParkingInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? longitude = null,Object? latitude = null,Object? parkingName = null,Object? parkingType = null,Object? parkingCategory = null,Object? parkingSpaces = null,Object? feeInfo = null,Object? openDays = null,Object? managingAgency = null,Object? contact = null,Object? roadAddress = null,Object? lotNumberAddress = null,Object? region = null,Object? subRegion = null,Object? regionCenterX = null,Object? regionCenterY = null,Object? modifiedDate = null,Object? parkingId = null,}) {
  return _then(_self.copyWith(
longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String,parkingName: null == parkingName ? _self.parkingName : parkingName // ignore: cast_nullable_to_non_nullable
as String,parkingType: null == parkingType ? _self.parkingType : parkingType // ignore: cast_nullable_to_non_nullable
as String,parkingCategory: null == parkingCategory ? _self.parkingCategory : parkingCategory // ignore: cast_nullable_to_non_nullable
as String,parkingSpaces: null == parkingSpaces ? _self.parkingSpaces : parkingSpaces // ignore: cast_nullable_to_non_nullable
as String,feeInfo: null == feeInfo ? _self.feeInfo : feeInfo // ignore: cast_nullable_to_non_nullable
as String,openDays: null == openDays ? _self.openDays : openDays // ignore: cast_nullable_to_non_nullable
as String,managingAgency: null == managingAgency ? _self.managingAgency : managingAgency // ignore: cast_nullable_to_non_nullable
as String,contact: null == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as String,roadAddress: null == roadAddress ? _self.roadAddress : roadAddress // ignore: cast_nullable_to_non_nullable
as String,lotNumberAddress: null == lotNumberAddress ? _self.lotNumberAddress : lotNumberAddress // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,subRegion: null == subRegion ? _self.subRegion : subRegion // ignore: cast_nullable_to_non_nullable
as String,regionCenterX: null == regionCenterX ? _self.regionCenterX : regionCenterX // ignore: cast_nullable_to_non_nullable
as String,regionCenterY: null == regionCenterY ? _self.regionCenterY : regionCenterY // ignore: cast_nullable_to_non_nullable
as String,modifiedDate: null == modifiedDate ? _self.modifiedDate : modifiedDate // ignore: cast_nullable_to_non_nullable
as String,parkingId: null == parkingId ? _self.parkingId : parkingId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ParkingInfo implements ParkingInfo {
   _ParkingInfo({@JsonKey(name: '경도') required this.longitude, @JsonKey(name: '위도') required this.latitude, @JsonKey(name: '주차장명') required this.parkingName, @JsonKey(name: '주차장구분') required this.parkingType, @JsonKey(name: '주차장유형') required this.parkingCategory, @JsonKey(name: '주차구획수') required this.parkingSpaces, @JsonKey(name: '요금정보') required this.feeInfo, @JsonKey(name: '운영요일') required this.openDays, @JsonKey(name: '관리기관명') required this.managingAgency, @JsonKey(name: '연락처') required this.contact, @JsonKey(name: '주차장도로명주소') required this.roadAddress, @JsonKey(name: '주차장지번주소') required this.lotNumberAddress, @JsonKey(name: '지역구분') required this.region, @JsonKey(name: '지역구분_sub') required this.subRegion, @JsonKey(name: '지역중심좌표(X좌표)') required this.regionCenterX, @JsonKey(name: '지역중심좌표(Y좌표)') required this.regionCenterY, @JsonKey(name: '수정일자') required this.modifiedDate, @JsonKey(name: '주차장관리번호') required this.parkingId});
  factory _ParkingInfo.fromJson(Map<String, dynamic> json) => _$ParkingInfoFromJson(json);

@override@JsonKey(name: '경도') final  String longitude;
@override@JsonKey(name: '위도') final  String latitude;
@override@JsonKey(name: '주차장명') final  String parkingName;
@override@JsonKey(name: '주차장구분') final  String parkingType;
@override@JsonKey(name: '주차장유형') final  String parkingCategory;
@override@JsonKey(name: '주차구획수') final  String parkingSpaces;
@override@JsonKey(name: '요금정보') final  String feeInfo;
@override@JsonKey(name: '운영요일') final  String openDays;
@override@JsonKey(name: '관리기관명') final  String managingAgency;
@override@JsonKey(name: '연락처') final  String contact;
@override@JsonKey(name: '주차장도로명주소') final  String roadAddress;
@override@JsonKey(name: '주차장지번주소') final  String lotNumberAddress;
@override@JsonKey(name: '지역구분') final  String region;
@override@JsonKey(name: '지역구분_sub') final  String subRegion;
@override@JsonKey(name: '지역중심좌표(X좌표)') final  String regionCenterX;
@override@JsonKey(name: '지역중심좌표(Y좌표)') final  String regionCenterY;
@override@JsonKey(name: '수정일자') final  String modifiedDate;
@override@JsonKey(name: '주차장관리번호') final  String parkingId;

/// Create a copy of ParkingInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParkingInfoCopyWith<_ParkingInfo> get copyWith => __$ParkingInfoCopyWithImpl<_ParkingInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParkingInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParkingInfo&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.parkingName, parkingName) || other.parkingName == parkingName)&&(identical(other.parkingType, parkingType) || other.parkingType == parkingType)&&(identical(other.parkingCategory, parkingCategory) || other.parkingCategory == parkingCategory)&&(identical(other.parkingSpaces, parkingSpaces) || other.parkingSpaces == parkingSpaces)&&(identical(other.feeInfo, feeInfo) || other.feeInfo == feeInfo)&&(identical(other.openDays, openDays) || other.openDays == openDays)&&(identical(other.managingAgency, managingAgency) || other.managingAgency == managingAgency)&&(identical(other.contact, contact) || other.contact == contact)&&(identical(other.roadAddress, roadAddress) || other.roadAddress == roadAddress)&&(identical(other.lotNumberAddress, lotNumberAddress) || other.lotNumberAddress == lotNumberAddress)&&(identical(other.region, region) || other.region == region)&&(identical(other.subRegion, subRegion) || other.subRegion == subRegion)&&(identical(other.regionCenterX, regionCenterX) || other.regionCenterX == regionCenterX)&&(identical(other.regionCenterY, regionCenterY) || other.regionCenterY == regionCenterY)&&(identical(other.modifiedDate, modifiedDate) || other.modifiedDate == modifiedDate)&&(identical(other.parkingId, parkingId) || other.parkingId == parkingId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,longitude,latitude,parkingName,parkingType,parkingCategory,parkingSpaces,feeInfo,openDays,managingAgency,contact,roadAddress,lotNumberAddress,region,subRegion,regionCenterX,regionCenterY,modifiedDate,parkingId);

@override
String toString() {
  return 'ParkingInfo(longitude: $longitude, latitude: $latitude, parkingName: $parkingName, parkingType: $parkingType, parkingCategory: $parkingCategory, parkingSpaces: $parkingSpaces, feeInfo: $feeInfo, openDays: $openDays, managingAgency: $managingAgency, contact: $contact, roadAddress: $roadAddress, lotNumberAddress: $lotNumberAddress, region: $region, subRegion: $subRegion, regionCenterX: $regionCenterX, regionCenterY: $regionCenterY, modifiedDate: $modifiedDate, parkingId: $parkingId)';
}


}

/// @nodoc
abstract mixin class _$ParkingInfoCopyWith<$Res> implements $ParkingInfoCopyWith<$Res> {
  factory _$ParkingInfoCopyWith(_ParkingInfo value, $Res Function(_ParkingInfo) _then) = __$ParkingInfoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '경도') String longitude,@JsonKey(name: '위도') String latitude,@JsonKey(name: '주차장명') String parkingName,@JsonKey(name: '주차장구분') String parkingType,@JsonKey(name: '주차장유형') String parkingCategory,@JsonKey(name: '주차구획수') String parkingSpaces,@JsonKey(name: '요금정보') String feeInfo,@JsonKey(name: '운영요일') String openDays,@JsonKey(name: '관리기관명') String managingAgency,@JsonKey(name: '연락처') String contact,@JsonKey(name: '주차장도로명주소') String roadAddress,@JsonKey(name: '주차장지번주소') String lotNumberAddress,@JsonKey(name: '지역구분') String region,@JsonKey(name: '지역구분_sub') String subRegion,@JsonKey(name: '지역중심좌표(X좌표)') String regionCenterX,@JsonKey(name: '지역중심좌표(Y좌표)') String regionCenterY,@JsonKey(name: '수정일자') String modifiedDate,@JsonKey(name: '주차장관리번호') String parkingId
});




}
/// @nodoc
class __$ParkingInfoCopyWithImpl<$Res>
    implements _$ParkingInfoCopyWith<$Res> {
  __$ParkingInfoCopyWithImpl(this._self, this._then);

  final _ParkingInfo _self;
  final $Res Function(_ParkingInfo) _then;

/// Create a copy of ParkingInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? longitude = null,Object? latitude = null,Object? parkingName = null,Object? parkingType = null,Object? parkingCategory = null,Object? parkingSpaces = null,Object? feeInfo = null,Object? openDays = null,Object? managingAgency = null,Object? contact = null,Object? roadAddress = null,Object? lotNumberAddress = null,Object? region = null,Object? subRegion = null,Object? regionCenterX = null,Object? regionCenterY = null,Object? modifiedDate = null,Object? parkingId = null,}) {
  return _then(_ParkingInfo(
longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String,parkingName: null == parkingName ? _self.parkingName : parkingName // ignore: cast_nullable_to_non_nullable
as String,parkingType: null == parkingType ? _self.parkingType : parkingType // ignore: cast_nullable_to_non_nullable
as String,parkingCategory: null == parkingCategory ? _self.parkingCategory : parkingCategory // ignore: cast_nullable_to_non_nullable
as String,parkingSpaces: null == parkingSpaces ? _self.parkingSpaces : parkingSpaces // ignore: cast_nullable_to_non_nullable
as String,feeInfo: null == feeInfo ? _self.feeInfo : feeInfo // ignore: cast_nullable_to_non_nullable
as String,openDays: null == openDays ? _self.openDays : openDays // ignore: cast_nullable_to_non_nullable
as String,managingAgency: null == managingAgency ? _self.managingAgency : managingAgency // ignore: cast_nullable_to_non_nullable
as String,contact: null == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as String,roadAddress: null == roadAddress ? _self.roadAddress : roadAddress // ignore: cast_nullable_to_non_nullable
as String,lotNumberAddress: null == lotNumberAddress ? _self.lotNumberAddress : lotNumberAddress // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,subRegion: null == subRegion ? _self.subRegion : subRegion // ignore: cast_nullable_to_non_nullable
as String,regionCenterX: null == regionCenterX ? _self.regionCenterX : regionCenterX // ignore: cast_nullable_to_non_nullable
as String,regionCenterY: null == regionCenterY ? _self.regionCenterY : regionCenterY // ignore: cast_nullable_to_non_nullable
as String,modifiedDate: null == modifiedDate ? _self.modifiedDate : modifiedDate // ignore: cast_nullable_to_non_nullable
as String,parkingId: null == parkingId ? _self.parkingId : parkingId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
