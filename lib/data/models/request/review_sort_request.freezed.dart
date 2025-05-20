// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_sort_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewSortRequest {
  String get code;
  String? get sort;

  /// Create a copy of ReviewSortRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewSortRequestCopyWith<ReviewSortRequest> get copyWith =>
      _$ReviewSortRequestCopyWithImpl<ReviewSortRequest>(
          this as ReviewSortRequest, _$identity);

  /// Serializes this ReviewSortRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewSortRequest &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.sort, sort) || other.sort == sort));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, sort);

  @override
  String toString() {
    return 'ReviewSortRequest(code: $code, sort: $sort)';
  }
}

/// @nodoc
abstract mixin class $ReviewSortRequestCopyWith<$Res> {
  factory $ReviewSortRequestCopyWith(
          ReviewSortRequest value, $Res Function(ReviewSortRequest) _then) =
      _$ReviewSortRequestCopyWithImpl;
  @useResult
  $Res call({String code, String? sort});
}

/// @nodoc
class _$ReviewSortRequestCopyWithImpl<$Res>
    implements $ReviewSortRequestCopyWith<$Res> {
  _$ReviewSortRequestCopyWithImpl(this._self, this._then);

  final ReviewSortRequest _self;
  final $Res Function(ReviewSortRequest) _then;

  /// Create a copy of ReviewSortRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? sort = freezed,
  }) {
    return _then(_self.copyWith(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      sort: freezed == sort
          ? _self.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ReviewSortRequest implements ReviewSortRequest {
  _ReviewSortRequest({required this.code, this.sort});
  factory _ReviewSortRequest.fromJson(Map<String, dynamic> json) =>
      _$ReviewSortRequestFromJson(json);

  @override
  final String code;
  @override
  final String? sort;

  /// Create a copy of ReviewSortRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewSortRequestCopyWith<_ReviewSortRequest> get copyWith =>
      __$ReviewSortRequestCopyWithImpl<_ReviewSortRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReviewSortRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewSortRequest &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.sort, sort) || other.sort == sort));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, sort);

  @override
  String toString() {
    return 'ReviewSortRequest(code: $code, sort: $sort)';
  }
}

/// @nodoc
abstract mixin class _$ReviewSortRequestCopyWith<$Res>
    implements $ReviewSortRequestCopyWith<$Res> {
  factory _$ReviewSortRequestCopyWith(
          _ReviewSortRequest value, $Res Function(_ReviewSortRequest) _then) =
      __$ReviewSortRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String code, String? sort});
}

/// @nodoc
class __$ReviewSortRequestCopyWithImpl<$Res>
    implements _$ReviewSortRequestCopyWith<$Res> {
  __$ReviewSortRequestCopyWithImpl(this._self, this._then);

  final _ReviewSortRequest _self;
  final $Res Function(_ReviewSortRequest) _then;

  /// Create a copy of ReviewSortRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = null,
    Object? sort = freezed,
  }) {
    return _then(_ReviewSortRequest(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      sort: freezed == sort
          ? _self.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
