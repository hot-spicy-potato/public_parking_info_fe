// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_filter_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewFilterRequest {
  String get mngCd;
  String? get sort;
  String? get kakaoId;

  /// Create a copy of ReviewFilterRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewFilterRequestCopyWith<ReviewFilterRequest> get copyWith =>
      _$ReviewFilterRequestCopyWithImpl<ReviewFilterRequest>(
          this as ReviewFilterRequest, _$identity);

  /// Serializes this ReviewFilterRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewFilterRequest &&
            (identical(other.mngCd, mngCd) || other.mngCd == mngCd) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.kakaoId, kakaoId) || other.kakaoId == kakaoId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mngCd, sort, kakaoId);

  @override
  String toString() {
    return 'ReviewFilterRequest(mngCd: $mngCd, sort: $sort, kakaoId: $kakaoId)';
  }
}

/// @nodoc
abstract mixin class $ReviewFilterRequestCopyWith<$Res> {
  factory $ReviewFilterRequestCopyWith(
          ReviewFilterRequest value, $Res Function(ReviewFilterRequest) _then) =
      _$ReviewFilterRequestCopyWithImpl;
  @useResult
  $Res call({String mngCd, String? sort, String? kakaoId});
}

/// @nodoc
class _$ReviewFilterRequestCopyWithImpl<$Res>
    implements $ReviewFilterRequestCopyWith<$Res> {
  _$ReviewFilterRequestCopyWithImpl(this._self, this._then);

  final ReviewFilterRequest _self;
  final $Res Function(ReviewFilterRequest) _then;

  /// Create a copy of ReviewFilterRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mngCd = null,
    Object? sort = freezed,
    Object? kakaoId = freezed,
  }) {
    return _then(_self.copyWith(
      mngCd: null == mngCd
          ? _self.mngCd
          : mngCd // ignore: cast_nullable_to_non_nullable
              as String,
      sort: freezed == sort
          ? _self.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String?,
      kakaoId: freezed == kakaoId
          ? _self.kakaoId
          : kakaoId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ReviewFilterRequest implements ReviewFilterRequest {
  _ReviewFilterRequest({required this.mngCd, this.sort, this.kakaoId});
  factory _ReviewFilterRequest.fromJson(Map<String, dynamic> json) =>
      _$ReviewFilterRequestFromJson(json);

  @override
  final String mngCd;
  @override
  final String? sort;
  @override
  final String? kakaoId;

  /// Create a copy of ReviewFilterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewFilterRequestCopyWith<_ReviewFilterRequest> get copyWith =>
      __$ReviewFilterRequestCopyWithImpl<_ReviewFilterRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReviewFilterRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewFilterRequest &&
            (identical(other.mngCd, mngCd) || other.mngCd == mngCd) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.kakaoId, kakaoId) || other.kakaoId == kakaoId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mngCd, sort, kakaoId);

  @override
  String toString() {
    return 'ReviewFilterRequest(mngCd: $mngCd, sort: $sort, kakaoId: $kakaoId)';
  }
}

/// @nodoc
abstract mixin class _$ReviewFilterRequestCopyWith<$Res>
    implements $ReviewFilterRequestCopyWith<$Res> {
  factory _$ReviewFilterRequestCopyWith(_ReviewFilterRequest value,
          $Res Function(_ReviewFilterRequest) _then) =
      __$ReviewFilterRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String mngCd, String? sort, String? kakaoId});
}

/// @nodoc
class __$ReviewFilterRequestCopyWithImpl<$Res>
    implements _$ReviewFilterRequestCopyWith<$Res> {
  __$ReviewFilterRequestCopyWithImpl(this._self, this._then);

  final _ReviewFilterRequest _self;
  final $Res Function(_ReviewFilterRequest) _then;

  /// Create a copy of ReviewFilterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? mngCd = null,
    Object? sort = freezed,
    Object? kakaoId = freezed,
  }) {
    return _then(_ReviewFilterRequest(
      mngCd: null == mngCd
          ? _self.mngCd
          : mngCd // ignore: cast_nullable_to_non_nullable
              as String,
      sort: freezed == sort
          ? _self.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String?,
      kakaoId: freezed == kakaoId
          ? _self.kakaoId
          : kakaoId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
