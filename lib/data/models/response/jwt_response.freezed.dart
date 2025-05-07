// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jwt_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JwtResponse {
  String get token;

  /// Create a copy of JwtResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JwtResponseCopyWith<JwtResponse> get copyWith =>
      _$JwtResponseCopyWithImpl<JwtResponse>(this as JwtResponse, _$identity);

  /// Serializes this JwtResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JwtResponse &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token);

  @override
  String toString() {
    return 'JwtResponse(token: $token)';
  }
}

/// @nodoc
abstract mixin class $JwtResponseCopyWith<$Res> {
  factory $JwtResponseCopyWith(
          JwtResponse value, $Res Function(JwtResponse) _then) =
      _$JwtResponseCopyWithImpl;
  @useResult
  $Res call({String token});
}

/// @nodoc
class _$JwtResponseCopyWithImpl<$Res> implements $JwtResponseCopyWith<$Res> {
  _$JwtResponseCopyWithImpl(this._self, this._then);

  final JwtResponse _self;
  final $Res Function(JwtResponse) _then;

  /// Create a copy of JwtResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_self.copyWith(
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _JwtResponse implements JwtResponse {
  _JwtResponse({required this.token});
  factory _JwtResponse.fromJson(Map<String, dynamic> json) =>
      _$JwtResponseFromJson(json);

  @override
  final String token;

  /// Create a copy of JwtResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$JwtResponseCopyWith<_JwtResponse> get copyWith =>
      __$JwtResponseCopyWithImpl<_JwtResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$JwtResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _JwtResponse &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token);

  @override
  String toString() {
    return 'JwtResponse(token: $token)';
  }
}

/// @nodoc
abstract mixin class _$JwtResponseCopyWith<$Res>
    implements $JwtResponseCopyWith<$Res> {
  factory _$JwtResponseCopyWith(
          _JwtResponse value, $Res Function(_JwtResponse) _then) =
      __$JwtResponseCopyWithImpl;
  @override
  @useResult
  $Res call({String token});
}

/// @nodoc
class __$JwtResponseCopyWithImpl<$Res> implements _$JwtResponseCopyWith<$Res> {
  __$JwtResponseCopyWithImpl(this._self, this._then);

  final _JwtResponse _self;
  final $Res Function(_JwtResponse) _then;

  /// Create a copy of JwtResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? token = null,
  }) {
    return _then(_JwtResponse(
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
