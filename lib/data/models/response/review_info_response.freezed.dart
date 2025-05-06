// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_info_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewInfoResponse {
  String get code;
  int get total;
  double get score;
  String get favoriteState;

  /// Create a copy of ReviewInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewInfoResponseCopyWith<ReviewInfoResponse> get copyWith =>
      _$ReviewInfoResponseCopyWithImpl<ReviewInfoResponse>(
          this as ReviewInfoResponse, _$identity);

  /// Serializes this ReviewInfoResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewInfoResponse &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.favoriteState, favoriteState) ||
                other.favoriteState == favoriteState));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, total, score, favoriteState);

  @override
  String toString() {
    return 'ReviewInfoResponse(code: $code, total: $total, score: $score, favoriteState: $favoriteState)';
  }
}

/// @nodoc
abstract mixin class $ReviewInfoResponseCopyWith<$Res> {
  factory $ReviewInfoResponseCopyWith(
          ReviewInfoResponse value, $Res Function(ReviewInfoResponse) _then) =
      _$ReviewInfoResponseCopyWithImpl;
  @useResult
  $Res call({String code, int total, double score, String favoriteState});
}

/// @nodoc
class _$ReviewInfoResponseCopyWithImpl<$Res>
    implements $ReviewInfoResponseCopyWith<$Res> {
  _$ReviewInfoResponseCopyWithImpl(this._self, this._then);

  final ReviewInfoResponse _self;
  final $Res Function(ReviewInfoResponse) _then;

  /// Create a copy of ReviewInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? total = null,
    Object? score = null,
    Object? favoriteState = null,
  }) {
    return _then(_self.copyWith(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      favoriteState: null == favoriteState
          ? _self.favoriteState
          : favoriteState // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ReviewInfoResponse implements ReviewInfoResponse {
  _ReviewInfoResponse(
      {required this.code,
      required this.total,
      required this.score,
      required this.favoriteState});
  factory _ReviewInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewInfoResponseFromJson(json);

  @override
  final String code;
  @override
  final int total;
  @override
  final double score;
  @override
  final String favoriteState;

  /// Create a copy of ReviewInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewInfoResponseCopyWith<_ReviewInfoResponse> get copyWith =>
      __$ReviewInfoResponseCopyWithImpl<_ReviewInfoResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReviewInfoResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewInfoResponse &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.favoriteState, favoriteState) ||
                other.favoriteState == favoriteState));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, total, score, favoriteState);

  @override
  String toString() {
    return 'ReviewInfoResponse(code: $code, total: $total, score: $score, favoriteState: $favoriteState)';
  }
}

/// @nodoc
abstract mixin class _$ReviewInfoResponseCopyWith<$Res>
    implements $ReviewInfoResponseCopyWith<$Res> {
  factory _$ReviewInfoResponseCopyWith(
          _ReviewInfoResponse value, $Res Function(_ReviewInfoResponse) _then) =
      __$ReviewInfoResponseCopyWithImpl;
  @override
  @useResult
  $Res call({String code, int total, double score, String favoriteState});
}

/// @nodoc
class __$ReviewInfoResponseCopyWithImpl<$Res>
    implements _$ReviewInfoResponseCopyWith<$Res> {
  __$ReviewInfoResponseCopyWithImpl(this._self, this._then);

  final _ReviewInfoResponse _self;
  final $Res Function(_ReviewInfoResponse) _then;

  /// Create a copy of ReviewInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = null,
    Object? total = null,
    Object? score = null,
    Object? favoriteState = null,
  }) {
    return _then(_ReviewInfoResponse(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      favoriteState: null == favoriteState
          ? _self.favoriteState
          : favoriteState // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
