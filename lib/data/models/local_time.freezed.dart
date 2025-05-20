// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_time.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocalTime {
  int get hour;
  int get minute;
  int get second;
  int get nano;

  /// Create a copy of LocalTime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocalTimeCopyWith<LocalTime> get copyWith =>
      _$LocalTimeCopyWithImpl<LocalTime>(this as LocalTime, _$identity);

  /// Serializes this LocalTime to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocalTime &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.minute, minute) || other.minute == minute) &&
            (identical(other.second, second) || other.second == second) &&
            (identical(other.nano, nano) || other.nano == nano));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hour, minute, second, nano);

  @override
  String toString() {
    return 'LocalTime(hour: $hour, minute: $minute, second: $second, nano: $nano)';
  }
}

/// @nodoc
abstract mixin class $LocalTimeCopyWith<$Res> {
  factory $LocalTimeCopyWith(LocalTime value, $Res Function(LocalTime) _then) =
      _$LocalTimeCopyWithImpl;
  @useResult
  $Res call({int hour, int minute, int second, int nano});
}

/// @nodoc
class _$LocalTimeCopyWithImpl<$Res> implements $LocalTimeCopyWith<$Res> {
  _$LocalTimeCopyWithImpl(this._self, this._then);

  final LocalTime _self;
  final $Res Function(LocalTime) _then;

  /// Create a copy of LocalTime
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? minute = null,
    Object? second = null,
    Object? nano = null,
  }) {
    return _then(_self.copyWith(
      hour: null == hour
          ? _self.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _self.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      second: null == second
          ? _self.second
          : second // ignore: cast_nullable_to_non_nullable
              as int,
      nano: null == nano
          ? _self.nano
          : nano // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _LocalTime implements LocalTime {
  _LocalTime(
      {required this.hour,
      required this.minute,
      required this.second,
      required this.nano});
  factory _LocalTime.fromJson(Map<String, dynamic> json) =>
      _$LocalTimeFromJson(json);

  @override
  final int hour;
  @override
  final int minute;
  @override
  final int second;
  @override
  final int nano;

  /// Create a copy of LocalTime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocalTimeCopyWith<_LocalTime> get copyWith =>
      __$LocalTimeCopyWithImpl<_LocalTime>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LocalTimeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocalTime &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.minute, minute) || other.minute == minute) &&
            (identical(other.second, second) || other.second == second) &&
            (identical(other.nano, nano) || other.nano == nano));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hour, minute, second, nano);

  @override
  String toString() {
    return 'LocalTime(hour: $hour, minute: $minute, second: $second, nano: $nano)';
  }
}

/// @nodoc
abstract mixin class _$LocalTimeCopyWith<$Res>
    implements $LocalTimeCopyWith<$Res> {
  factory _$LocalTimeCopyWith(
          _LocalTime value, $Res Function(_LocalTime) _then) =
      __$LocalTimeCopyWithImpl;
  @override
  @useResult
  $Res call({int hour, int minute, int second, int nano});
}

/// @nodoc
class __$LocalTimeCopyWithImpl<$Res> implements _$LocalTimeCopyWith<$Res> {
  __$LocalTimeCopyWithImpl(this._self, this._then);

  final _LocalTime _self;
  final $Res Function(_LocalTime) _then;

  /// Create a copy of LocalTime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? hour = null,
    Object? minute = null,
    Object? second = null,
    Object? nano = null,
  }) {
    return _then(_LocalTime(
      hour: null == hour
          ? _self.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _self.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      second: null == second
          ? _self.second
          : second // ignore: cast_nullable_to_non_nullable
              as int,
      nano: null == nano
          ? _self.nano
          : nano // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
