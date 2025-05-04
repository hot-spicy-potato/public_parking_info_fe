// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewRequest {
  String get mngCd;
  String get sort;

  /// Create a copy of ReviewRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewRequestCopyWith<ReviewRequest> get copyWith =>
      _$ReviewRequestCopyWithImpl<ReviewRequest>(
          this as ReviewRequest, _$identity);

  /// Serializes this ReviewRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewRequest &&
            (identical(other.mngCd, mngCd) || other.mngCd == mngCd) &&
            (identical(other.sort, sort) || other.sort == sort));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mngCd, sort);

  @override
  String toString() {
    return 'ReviewRequest(mngCd: $mngCd, sort: $sort)';
  }
}

/// @nodoc
abstract mixin class $ReviewRequestCopyWith<$Res> {
  factory $ReviewRequestCopyWith(
          ReviewRequest value, $Res Function(ReviewRequest) _then) =
      _$ReviewRequestCopyWithImpl;
  @useResult
  $Res call({String mngCd, String sort});
}

/// @nodoc
class _$ReviewRequestCopyWithImpl<$Res>
    implements $ReviewRequestCopyWith<$Res> {
  _$ReviewRequestCopyWithImpl(this._self, this._then);

  final ReviewRequest _self;
  final $Res Function(ReviewRequest) _then;

  /// Create a copy of ReviewRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mngCd = null,
    Object? sort = null,
  }) {
    return _then(_self.copyWith(
      mngCd: null == mngCd
          ? _self.mngCd
          : mngCd // ignore: cast_nullable_to_non_nullable
              as String,
      sort: null == sort
          ? _self.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ReviewRequest implements ReviewRequest {
  _ReviewRequest({required this.mngCd, required this.sort});
  factory _ReviewRequest.fromJson(Map<String, dynamic> json) =>
      _$ReviewRequestFromJson(json);

  @override
  final String mngCd;
  @override
  final String sort;

  /// Create a copy of ReviewRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewRequestCopyWith<_ReviewRequest> get copyWith =>
      __$ReviewRequestCopyWithImpl<_ReviewRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReviewRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewRequest &&
            (identical(other.mngCd, mngCd) || other.mngCd == mngCd) &&
            (identical(other.sort, sort) || other.sort == sort));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mngCd, sort);

  @override
  String toString() {
    return 'ReviewRequest(mngCd: $mngCd, sort: $sort)';
  }
}

/// @nodoc
abstract mixin class _$ReviewRequestCopyWith<$Res>
    implements $ReviewRequestCopyWith<$Res> {
  factory _$ReviewRequestCopyWith(
          _ReviewRequest value, $Res Function(_ReviewRequest) _then) =
      __$ReviewRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String mngCd, String sort});
}

/// @nodoc
class __$ReviewRequestCopyWithImpl<$Res>
    implements _$ReviewRequestCopyWith<$Res> {
  __$ReviewRequestCopyWithImpl(this._self, this._then);

  final _ReviewRequest _self;
  final $Res Function(_ReviewRequest) _then;

  /// Create a copy of ReviewRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? mngCd = null,
    Object? sort = null,
  }) {
    return _then(_ReviewRequest(
      mngCd: null == mngCd
          ? _self.mngCd
          : mngCd // ignore: cast_nullable_to_non_nullable
              as String,
      sort: null == sort
          ? _self.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
