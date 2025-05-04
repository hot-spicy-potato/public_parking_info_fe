// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewListResponse {
  List<ReviewListItem> get favoriteList;

  /// Create a copy of ReviewListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewListResponseCopyWith<ReviewListResponse> get copyWith =>
      _$ReviewListResponseCopyWithImpl<ReviewListResponse>(
          this as ReviewListResponse, _$identity);

  /// Serializes this ReviewListResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewListResponse &&
            const DeepCollectionEquality()
                .equals(other.favoriteList, favoriteList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(favoriteList));

  @override
  String toString() {
    return 'ReviewListResponse(favoriteList: $favoriteList)';
  }
}

/// @nodoc
abstract mixin class $ReviewListResponseCopyWith<$Res> {
  factory $ReviewListResponseCopyWith(
          ReviewListResponse value, $Res Function(ReviewListResponse) _then) =
      _$ReviewListResponseCopyWithImpl;
  @useResult
  $Res call({List<ReviewListItem> favoriteList});
}

/// @nodoc
class _$ReviewListResponseCopyWithImpl<$Res>
    implements $ReviewListResponseCopyWith<$Res> {
  _$ReviewListResponseCopyWithImpl(this._self, this._then);

  final ReviewListResponse _self;
  final $Res Function(ReviewListResponse) _then;

  /// Create a copy of ReviewListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteList = null,
  }) {
    return _then(_self.copyWith(
      favoriteList: null == favoriteList
          ? _self.favoriteList
          : favoriteList // ignore: cast_nullable_to_non_nullable
              as List<ReviewListItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ReviewListResponse implements ReviewListResponse {
  _ReviewListResponse({required final List<ReviewListItem> favoriteList})
      : _favoriteList = favoriteList;
  factory _ReviewListResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewListResponseFromJson(json);

  final List<ReviewListItem> _favoriteList;
  @override
  List<ReviewListItem> get favoriteList {
    if (_favoriteList is EqualUnmodifiableListView) return _favoriteList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteList);
  }

  /// Create a copy of ReviewListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewListResponseCopyWith<_ReviewListResponse> get copyWith =>
      __$ReviewListResponseCopyWithImpl<_ReviewListResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReviewListResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewListResponse &&
            const DeepCollectionEquality()
                .equals(other._favoriteList, _favoriteList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_favoriteList));

  @override
  String toString() {
    return 'ReviewListResponse(favoriteList: $favoriteList)';
  }
}

/// @nodoc
abstract mixin class _$ReviewListResponseCopyWith<$Res>
    implements $ReviewListResponseCopyWith<$Res> {
  factory _$ReviewListResponseCopyWith(
          _ReviewListResponse value, $Res Function(_ReviewListResponse) _then) =
      __$ReviewListResponseCopyWithImpl;
  @override
  @useResult
  $Res call({List<ReviewListItem> favoriteList});
}

/// @nodoc
class __$ReviewListResponseCopyWithImpl<$Res>
    implements _$ReviewListResponseCopyWith<$Res> {
  __$ReviewListResponseCopyWithImpl(this._self, this._then);

  final _ReviewListResponse _self;
  final $Res Function(_ReviewListResponse) _then;

  /// Create a copy of ReviewListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? favoriteList = null,
  }) {
    return _then(_ReviewListResponse(
      favoriteList: null == favoriteList
          ? _self._favoriteList
          : favoriteList // ignore: cast_nullable_to_non_nullable
              as List<ReviewListItem>,
    ));
  }
}

/// @nodoc
mixin _$ReviewListItem {
  int get id;
  String get kakaoId;
  String get code;
  double get score;
  String get content;
  DateTime get reviewDate;
  DateTime get reviewTime;
  DateTime get updateTime;
  bool get isMyReview;

  /// Create a copy of ReviewListItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewListItemCopyWith<ReviewListItem> get copyWith =>
      _$ReviewListItemCopyWithImpl<ReviewListItem>(
          this as ReviewListItem, _$identity);

  /// Serializes this ReviewListItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewListItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.kakaoId, kakaoId) || other.kakaoId == kakaoId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.reviewDate, reviewDate) ||
                other.reviewDate == reviewDate) &&
            (identical(other.reviewTime, reviewTime) ||
                other.reviewTime == reviewTime) &&
            (identical(other.updateTime, updateTime) ||
                other.updateTime == updateTime) &&
            (identical(other.isMyReview, isMyReview) ||
                other.isMyReview == isMyReview));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, kakaoId, code, score,
      content, reviewDate, reviewTime, updateTime, isMyReview);

  @override
  String toString() {
    return 'ReviewListItem(id: $id, kakaoId: $kakaoId, code: $code, score: $score, content: $content, reviewDate: $reviewDate, reviewTime: $reviewTime, updateTime: $updateTime, isMyReview: $isMyReview)';
  }
}

/// @nodoc
abstract mixin class $ReviewListItemCopyWith<$Res> {
  factory $ReviewListItemCopyWith(
          ReviewListItem value, $Res Function(ReviewListItem) _then) =
      _$ReviewListItemCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String kakaoId,
      String code,
      double score,
      String content,
      DateTime reviewDate,
      DateTime reviewTime,
      DateTime updateTime,
      bool isMyReview});
}

/// @nodoc
class _$ReviewListItemCopyWithImpl<$Res>
    implements $ReviewListItemCopyWith<$Res> {
  _$ReviewListItemCopyWithImpl(this._self, this._then);

  final ReviewListItem _self;
  final $Res Function(ReviewListItem) _then;

  /// Create a copy of ReviewListItem
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
    Object? reviewTime = null,
    Object? updateTime = null,
    Object? isMyReview = null,
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
      reviewTime: null == reviewTime
          ? _self.reviewTime
          : reviewTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateTime: null == updateTime
          ? _self.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isMyReview: null == isMyReview
          ? _self.isMyReview
          : isMyReview // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ReviewListItem implements ReviewListItem {
  _ReviewListItem(
      {required this.id,
      required this.kakaoId,
      required this.code,
      required this.score,
      required this.content,
      required this.reviewDate,
      required this.reviewTime,
      required this.updateTime,
      required this.isMyReview});
  factory _ReviewListItem.fromJson(Map<String, dynamic> json) =>
      _$ReviewListItemFromJson(json);

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
  final DateTime reviewTime;
  @override
  final DateTime updateTime;
  @override
  final bool isMyReview;

  /// Create a copy of ReviewListItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewListItemCopyWith<_ReviewListItem> get copyWith =>
      __$ReviewListItemCopyWithImpl<_ReviewListItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReviewListItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewListItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.kakaoId, kakaoId) || other.kakaoId == kakaoId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.reviewDate, reviewDate) ||
                other.reviewDate == reviewDate) &&
            (identical(other.reviewTime, reviewTime) ||
                other.reviewTime == reviewTime) &&
            (identical(other.updateTime, updateTime) ||
                other.updateTime == updateTime) &&
            (identical(other.isMyReview, isMyReview) ||
                other.isMyReview == isMyReview));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, kakaoId, code, score,
      content, reviewDate, reviewTime, updateTime, isMyReview);

  @override
  String toString() {
    return 'ReviewListItem(id: $id, kakaoId: $kakaoId, code: $code, score: $score, content: $content, reviewDate: $reviewDate, reviewTime: $reviewTime, updateTime: $updateTime, isMyReview: $isMyReview)';
  }
}

/// @nodoc
abstract mixin class _$ReviewListItemCopyWith<$Res>
    implements $ReviewListItemCopyWith<$Res> {
  factory _$ReviewListItemCopyWith(
          _ReviewListItem value, $Res Function(_ReviewListItem) _then) =
      __$ReviewListItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String kakaoId,
      String code,
      double score,
      String content,
      DateTime reviewDate,
      DateTime reviewTime,
      DateTime updateTime,
      bool isMyReview});
}

/// @nodoc
class __$ReviewListItemCopyWithImpl<$Res>
    implements _$ReviewListItemCopyWith<$Res> {
  __$ReviewListItemCopyWithImpl(this._self, this._then);

  final _ReviewListItem _self;
  final $Res Function(_ReviewListItem) _then;

  /// Create a copy of ReviewListItem
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
    Object? reviewTime = null,
    Object? updateTime = null,
    Object? isMyReview = null,
  }) {
    return _then(_ReviewListItem(
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
      reviewTime: null == reviewTime
          ? _self.reviewTime
          : reviewTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateTime: null == updateTime
          ? _self.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isMyReview: null == isMyReview
          ? _self.isMyReview
          : isMyReview // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
