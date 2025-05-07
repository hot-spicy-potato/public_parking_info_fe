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
  List<ReviewListItemResponse> get reviews;

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
            const DeepCollectionEquality().equals(other.reviews, reviews));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(reviews));

  @override
  String toString() {
    return 'ReviewListResponse(reviews: $reviews)';
  }
}

/// @nodoc
abstract mixin class $ReviewListResponseCopyWith<$Res> {
  factory $ReviewListResponseCopyWith(
          ReviewListResponse value, $Res Function(ReviewListResponse) _then) =
      _$ReviewListResponseCopyWithImpl;
  @useResult
  $Res call({List<ReviewListItemResponse> reviews});
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
    Object? reviews = null,
  }) {
    return _then(_self.copyWith(
      reviews: null == reviews
          ? _self.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewListItemResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ReviewListResponse implements ReviewListResponse {
  _ReviewListResponse({required final List<ReviewListItemResponse> reviews})
      : _reviews = reviews;
  factory _ReviewListResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewListResponseFromJson(json);

  final List<ReviewListItemResponse> _reviews;
  @override
  List<ReviewListItemResponse> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
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
            const DeepCollectionEquality().equals(other._reviews, _reviews));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_reviews));

  @override
  String toString() {
    return 'ReviewListResponse(reviews: $reviews)';
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
  $Res call({List<ReviewListItemResponse> reviews});
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
    Object? reviews = null,
  }) {
    return _then(_ReviewListResponse(
      reviews: null == reviews
          ? _self._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewListItemResponse>,
    ));
  }
}

/// @nodoc
mixin _$ReviewListItemResponse {
  int get id;
  String get name;
  String get content;
  double get score;
  DateTime get reviewDate;
  bool get myReview;

  /// Create a copy of ReviewListItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewListItemResponseCopyWith<ReviewListItemResponse> get copyWith =>
      _$ReviewListItemResponseCopyWithImpl<ReviewListItemResponse>(
          this as ReviewListItemResponse, _$identity);

  /// Serializes this ReviewListItemResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewListItemResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.reviewDate, reviewDate) ||
                other.reviewDate == reviewDate) &&
            (identical(other.myReview, myReview) ||
                other.myReview == myReview));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, content, score, reviewDate, myReview);

  @override
  String toString() {
    return 'ReviewListItemResponse(id: $id, name: $name, content: $content, score: $score, reviewDate: $reviewDate, myReview: $myReview)';
  }
}

/// @nodoc
abstract mixin class $ReviewListItemResponseCopyWith<$Res> {
  factory $ReviewListItemResponseCopyWith(ReviewListItemResponse value,
          $Res Function(ReviewListItemResponse) _then) =
      _$ReviewListItemResponseCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String name,
      String content,
      double score,
      DateTime reviewDate,
      bool myReview});
}

/// @nodoc
class _$ReviewListItemResponseCopyWithImpl<$Res>
    implements $ReviewListItemResponseCopyWith<$Res> {
  _$ReviewListItemResponseCopyWithImpl(this._self, this._then);

  final ReviewListItemResponse _self;
  final $Res Function(ReviewListItemResponse) _then;

  /// Create a copy of ReviewListItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? content = null,
    Object? score = null,
    Object? reviewDate = null,
    Object? myReview = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      reviewDate: null == reviewDate
          ? _self.reviewDate
          : reviewDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      myReview: null == myReview
          ? _self.myReview
          : myReview // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ReviewListItemResponse implements ReviewListItemResponse {
  _ReviewListItemResponse(
      {required this.id,
      required this.name,
      required this.content,
      required this.score,
      required this.reviewDate,
      required this.myReview});
  factory _ReviewListItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewListItemResponseFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String content;
  @override
  final double score;
  @override
  final DateTime reviewDate;
  @override
  final bool myReview;

  /// Create a copy of ReviewListItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewListItemResponseCopyWith<_ReviewListItemResponse> get copyWith =>
      __$ReviewListItemResponseCopyWithImpl<_ReviewListItemResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReviewListItemResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewListItemResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.reviewDate, reviewDate) ||
                other.reviewDate == reviewDate) &&
            (identical(other.myReview, myReview) ||
                other.myReview == myReview));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, content, score, reviewDate, myReview);

  @override
  String toString() {
    return 'ReviewListItemResponse(id: $id, name: $name, content: $content, score: $score, reviewDate: $reviewDate, myReview: $myReview)';
  }
}

/// @nodoc
abstract mixin class _$ReviewListItemResponseCopyWith<$Res>
    implements $ReviewListItemResponseCopyWith<$Res> {
  factory _$ReviewListItemResponseCopyWith(_ReviewListItemResponse value,
          $Res Function(_ReviewListItemResponse) _then) =
      __$ReviewListItemResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String content,
      double score,
      DateTime reviewDate,
      bool myReview});
}

/// @nodoc
class __$ReviewListItemResponseCopyWithImpl<$Res>
    implements _$ReviewListItemResponseCopyWith<$Res> {
  __$ReviewListItemResponseCopyWithImpl(this._self, this._then);

  final _ReviewListItemResponse _self;
  final $Res Function(_ReviewListItemResponse) _then;

  /// Create a copy of ReviewListItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? content = null,
    Object? score = null,
    Object? reviewDate = null,
    Object? myReview = null,
  }) {
    return _then(_ReviewListItemResponse(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      reviewDate: null == reviewDate
          ? _self.reviewDate
          : reviewDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      myReview: null == myReview
          ? _self.myReview
          : myReview // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
