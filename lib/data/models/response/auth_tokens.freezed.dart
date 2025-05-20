// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_tokens.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthTokens {
  String get accessToken;
  String get refreshToken;
  String get grantType;
  int get expiresIn;

  /// Create a copy of AuthTokens
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthTokensCopyWith<AuthTokens> get copyWith =>
      _$AuthTokensCopyWithImpl<AuthTokens>(this as AuthTokens, _$identity);

  /// Serializes this AuthTokens to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthTokens &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.grantType, grantType) ||
                other.grantType == grantType) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, refreshToken, grantType, expiresIn);

  @override
  String toString() {
    return 'AuthTokens(accessToken: $accessToken, refreshToken: $refreshToken, grantType: $grantType, expiresIn: $expiresIn)';
  }
}

/// @nodoc
abstract mixin class $AuthTokensCopyWith<$Res> {
  factory $AuthTokensCopyWith(
          AuthTokens value, $Res Function(AuthTokens) _then) =
      _$AuthTokensCopyWithImpl;
  @useResult
  $Res call(
      {String accessToken,
      String refreshToken,
      String grantType,
      int expiresIn});
}

/// @nodoc
class _$AuthTokensCopyWithImpl<$Res> implements $AuthTokensCopyWith<$Res> {
  _$AuthTokensCopyWithImpl(this._self, this._then);

  final AuthTokens _self;
  final $Res Function(AuthTokens) _then;

  /// Create a copy of AuthTokens
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? grantType = null,
    Object? expiresIn = null,
  }) {
    return _then(_self.copyWith(
      accessToken: null == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      grantType: null == grantType
          ? _self.grantType
          : grantType // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _self.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AuthTokens implements AuthTokens {
  _AuthTokens(
      {required this.accessToken,
      required this.refreshToken,
      required this.grantType,
      required this.expiresIn});
  factory _AuthTokens.fromJson(Map<String, dynamic> json) =>
      _$AuthTokensFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final String grantType;
  @override
  final int expiresIn;

  /// Create a copy of AuthTokens
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthTokensCopyWith<_AuthTokens> get copyWith =>
      __$AuthTokensCopyWithImpl<_AuthTokens>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AuthTokensToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthTokens &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.grantType, grantType) ||
                other.grantType == grantType) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, refreshToken, grantType, expiresIn);

  @override
  String toString() {
    return 'AuthTokens(accessToken: $accessToken, refreshToken: $refreshToken, grantType: $grantType, expiresIn: $expiresIn)';
  }
}

/// @nodoc
abstract mixin class _$AuthTokensCopyWith<$Res>
    implements $AuthTokensCopyWith<$Res> {
  factory _$AuthTokensCopyWith(
          _AuthTokens value, $Res Function(_AuthTokens) _then) =
      __$AuthTokensCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String accessToken,
      String refreshToken,
      String grantType,
      int expiresIn});
}

/// @nodoc
class __$AuthTokensCopyWithImpl<$Res> implements _$AuthTokensCopyWith<$Res> {
  __$AuthTokensCopyWithImpl(this._self, this._then);

  final _AuthTokens _self;
  final $Res Function(_AuthTokens) _then;

  /// Create a copy of AuthTokens
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? grantType = null,
    Object? expiresIn = null,
  }) {
    return _then(_AuthTokens(
      accessToken: null == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      grantType: null == grantType
          ? _self.grantType
          : grantType // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _self.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
