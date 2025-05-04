// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FavoriteResponse {
  String get kakaoId;
  String get state;

  /// Create a copy of FavoriteResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FavoriteResponseCopyWith<FavoriteResponse> get copyWith =>
      _$FavoriteResponseCopyWithImpl<FavoriteResponse>(
          this as FavoriteResponse, _$identity);

  /// Serializes this FavoriteResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FavoriteResponse &&
            (identical(other.kakaoId, kakaoId) || other.kakaoId == kakaoId) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, kakaoId, state);

  @override
  String toString() {
    return 'FavoriteResponse(kakaoId: $kakaoId, state: $state)';
  }
}

/// @nodoc
abstract mixin class $FavoriteResponseCopyWith<$Res> {
  factory $FavoriteResponseCopyWith(
          FavoriteResponse value, $Res Function(FavoriteResponse) _then) =
      _$FavoriteResponseCopyWithImpl;
  @useResult
  $Res call({String kakaoId, String state});
}

/// @nodoc
class _$FavoriteResponseCopyWithImpl<$Res>
    implements $FavoriteResponseCopyWith<$Res> {
  _$FavoriteResponseCopyWithImpl(this._self, this._then);

  final FavoriteResponse _self;
  final $Res Function(FavoriteResponse) _then;

  /// Create a copy of FavoriteResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kakaoId = null,
    Object? state = null,
  }) {
    return _then(_self.copyWith(
      kakaoId: null == kakaoId
          ? _self.kakaoId
          : kakaoId // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _FavoriteResponse implements FavoriteResponse {
  _FavoriteResponse({required this.kakaoId, required this.state});
  factory _FavoriteResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteResponseFromJson(json);

  @override
  final String kakaoId;
  @override
  final String state;

  /// Create a copy of FavoriteResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FavoriteResponseCopyWith<_FavoriteResponse> get copyWith =>
      __$FavoriteResponseCopyWithImpl<_FavoriteResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FavoriteResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FavoriteResponse &&
            (identical(other.kakaoId, kakaoId) || other.kakaoId == kakaoId) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, kakaoId, state);

  @override
  String toString() {
    return 'FavoriteResponse(kakaoId: $kakaoId, state: $state)';
  }
}

/// @nodoc
abstract mixin class _$FavoriteResponseCopyWith<$Res>
    implements $FavoriteResponseCopyWith<$Res> {
  factory _$FavoriteResponseCopyWith(
          _FavoriteResponse value, $Res Function(_FavoriteResponse) _then) =
      __$FavoriteResponseCopyWithImpl;
  @override
  @useResult
  $Res call({String kakaoId, String state});
}

/// @nodoc
class __$FavoriteResponseCopyWithImpl<$Res>
    implements _$FavoriteResponseCopyWith<$Res> {
  __$FavoriteResponseCopyWithImpl(this._self, this._then);

  final _FavoriteResponse _self;
  final $Res Function(_FavoriteResponse) _then;

  /// Create a copy of FavoriteResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? kakaoId = null,
    Object? state = null,
  }) {
    return _then(_FavoriteResponse(
      kakaoId: null == kakaoId
          ? _self.kakaoId
          : kakaoId // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
