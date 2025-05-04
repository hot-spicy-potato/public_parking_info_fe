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
  int get id;
  String get kakaoId;
  String get code;
  double get score;
  String get content;
  DateTime get reviewDate;
  DateTime get reviewtime;
  DateTime get updateTime;

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
            (identical(other.id, id) || other.id == id) &&
            (identical(other.kakaoId, kakaoId) || other.kakaoId == kakaoId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.reviewDate, reviewDate) ||
                other.reviewDate == reviewDate) &&
            (identical(other.reviewtime, reviewtime) ||
                other.reviewtime == reviewtime) &&
            (identical(other.updateTime, updateTime) ||
                other.updateTime == updateTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, kakaoId, code, score,
      content, reviewDate, reviewtime, updateTime);

  @override
  String toString() {
    return 'ReviewRequest(id: $id, kakaoId: $kakaoId, code: $code, score: $score, content: $content, reviewDate: $reviewDate, reviewtime: $reviewtime, updateTime: $updateTime)';
  }
}

/// @nodoc
abstract mixin class $ReviewRequestCopyWith<$Res> {
  factory $ReviewRequestCopyWith(
          ReviewRequest value, $Res Function(ReviewRequest) _then) =
      _$ReviewRequestCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String kakaoId,
      String code,
      double score,
      String content,
      DateTime reviewDate,
      DateTime reviewtime,
      DateTime updateTime});
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
    Object? id = null,
    Object? kakaoId = null,
    Object? code = null,
    Object? score = null,
    Object? content = null,
    Object? reviewDate = null,
    Object? reviewtime = null,
    Object? updateTime = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      kakaoId: null == kakaoId
          ? _self.kakaoId
          : kakaoId // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      reviewDate: null == reviewDate
          ? _self.reviewDate
          : reviewDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reviewtime: null == reviewtime
          ? _self.reviewtime
          : reviewtime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateTime: null == updateTime
          ? _self.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ReviewRequest implements ReviewRequest {
  _ReviewRequest(
      {required this.id,
      required this.kakaoId,
      required this.code,
      required this.score,
      required this.content,
      required this.reviewDate,
      required this.reviewtime,
      required this.updateTime});
  factory _ReviewRequest.fromJson(Map<String, dynamic> json) =>
      _$ReviewRequestFromJson(json);

  @override
  final int id;
  @override
  final String kakaoId;
  @override
  final String code;
  @override
  final double score;
  @override
  final String content;
  @override
  final DateTime reviewDate;
  @override
  final DateTime reviewtime;
  @override
  final DateTime updateTime;

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
            (identical(other.id, id) || other.id == id) &&
            (identical(other.kakaoId, kakaoId) || other.kakaoId == kakaoId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.reviewDate, reviewDate) ||
                other.reviewDate == reviewDate) &&
            (identical(other.reviewtime, reviewtime) ||
                other.reviewtime == reviewtime) &&
            (identical(other.updateTime, updateTime) ||
                other.updateTime == updateTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, kakaoId, code, score,
      content, reviewDate, reviewtime, updateTime);

  @override
  String toString() {
    return 'ReviewRequest(id: $id, kakaoId: $kakaoId, code: $code, score: $score, content: $content, reviewDate: $reviewDate, reviewtime: $reviewtime, updateTime: $updateTime)';
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
  $Res call(
      {int id,
      String kakaoId,
      String code,
      double score,
      String content,
      DateTime reviewDate,
      DateTime reviewtime,
      DateTime updateTime});
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
    Object? id = null,
    Object? kakaoId = null,
    Object? code = null,
    Object? score = null,
    Object? content = null,
    Object? reviewDate = null,
    Object? reviewtime = null,
    Object? updateTime = null,
  }) {
    return _then(_ReviewRequest(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      kakaoId: null == kakaoId
          ? _self.kakaoId
          : kakaoId // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      reviewDate: null == reviewDate
          ? _self.reviewDate
          : reviewDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reviewtime: null == reviewtime
          ? _self.reviewtime
          : reviewtime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateTime: null == updateTime
          ? _self.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
