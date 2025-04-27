// // ignore_for_file: invalid_annotation_target

// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'parking_response.freezed.dart';
// part 'parking_response.g.dart';

// @freezed
// class ParkingResponse with _$ParkingResponse {
//   factory ParkingResponse({
//     required int page,
//     required int perPage,
//     required int totalCount,
//     required int currentCount,
//     required int matchCount,
//     required List<ParkingInfo> data,
//   }) = _ParkingResponse;

//   factory ParkingResponse.fromJson(Map<String, dynamic> json) =>
//       _$ParkingResponseFromJson(json);

//   @override
//   dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
// }

// @freezed
// class ParkingInfo with _$ParkingInfo {
//   factory ParkingInfo({
//     @JsonKey(name: '경도') required String longitude,
//     @JsonKey(name: '위도') required String latitude,
//     @JsonKey(name: '주차장명') required String parkingName,
//     @JsonKey(name: '주차장구분') required String parkingType,
//     @JsonKey(name: '주차장유형') required String parkingCategory,
//     @JsonKey(name: '주차구획수') required String parkingSpaces,
//     @JsonKey(name: '요금정보') required String feeInfo,
//     @JsonKey(name: '운영요일') required String openDays,
//     @JsonKey(name: '관리기관명') required String managingAgency,
//     @JsonKey(name: '연락처') required String contact,
//     @JsonKey(name: '주차장도로명주소') required String roadAddress,
//     @JsonKey(name: '주차장지번주소') required String lotNumberAddress,
//     @JsonKey(name: '지역구분') required String region,
//     @JsonKey(name: '지역구분_sub') required String subRegion,
//     @JsonKey(name: '지역중심좌표(X좌표)') required String regionCenterX,
//     @JsonKey(name: '지역중심좌표(Y좌표)') required String regionCenterY,
//     @JsonKey(name: '수정일자') required String modifiedDate,
//     @JsonKey(name: '주차장관리번호') required String parkingId,
//   }) = _ParkingInfo;

//   factory ParkingInfo.fromJson(Map<String, dynamic> json) =>
//       _$ParkingInfoFromJson(json);

//   @override
//   dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
// }
