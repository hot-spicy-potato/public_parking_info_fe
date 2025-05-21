// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FavoriteListResponse {
  List<FavoriteListItem> get favoriteList;

  /// Create a copy of FavoriteListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FavoriteListResponseCopyWith<FavoriteListResponse> get copyWith =>
      _$FavoriteListResponseCopyWithImpl<FavoriteListResponse>(
          this as FavoriteListResponse, _$identity);

  /// Serializes this FavoriteListResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FavoriteListResponse &&
            const DeepCollectionEquality()
                .equals(other.favoriteList, favoriteList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(favoriteList));

  @override
  String toString() {
    return 'FavoriteListResponse(favoriteList: $favoriteList)';
  }
}

/// @nodoc
abstract mixin class $FavoriteListResponseCopyWith<$Res> {
  factory $FavoriteListResponseCopyWith(FavoriteListResponse value,
          $Res Function(FavoriteListResponse) _then) =
      _$FavoriteListResponseCopyWithImpl;
  @useResult
  $Res call({List<FavoriteListItem> favoriteList});
}

/// @nodoc
class _$FavoriteListResponseCopyWithImpl<$Res>
    implements $FavoriteListResponseCopyWith<$Res> {
  _$FavoriteListResponseCopyWithImpl(this._self, this._then);

  final FavoriteListResponse _self;
  final $Res Function(FavoriteListResponse) _then;

  /// Create a copy of FavoriteListResponse
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
              as List<FavoriteListItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _FavoriteListResponse implements FavoriteListResponse {
  _FavoriteListResponse({required final List<FavoriteListItem> favoriteList})
      : _favoriteList = favoriteList;
  factory _FavoriteListResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteListResponseFromJson(json);

  final List<FavoriteListItem> _favoriteList;
  @override
  List<FavoriteListItem> get favoriteList {
    if (_favoriteList is EqualUnmodifiableListView) return _favoriteList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteList);
  }

  /// Create a copy of FavoriteListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FavoriteListResponseCopyWith<_FavoriteListResponse> get copyWith =>
      __$FavoriteListResponseCopyWithImpl<_FavoriteListResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FavoriteListResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FavoriteListResponse &&
            const DeepCollectionEquality()
                .equals(other._favoriteList, _favoriteList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_favoriteList));

  @override
  String toString() {
    return 'FavoriteListResponse(favoriteList: $favoriteList)';
  }
}

/// @nodoc
abstract mixin class _$FavoriteListResponseCopyWith<$Res>
    implements $FavoriteListResponseCopyWith<$Res> {
  factory _$FavoriteListResponseCopyWith(_FavoriteListResponse value,
          $Res Function(_FavoriteListResponse) _then) =
      __$FavoriteListResponseCopyWithImpl;
  @override
  @useResult
  $Res call({List<FavoriteListItem> favoriteList});
}

/// @nodoc
class __$FavoriteListResponseCopyWithImpl<$Res>
    implements _$FavoriteListResponseCopyWith<$Res> {
  __$FavoriteListResponseCopyWithImpl(this._self, this._then);

  final _FavoriteListResponse _self;
  final $Res Function(_FavoriteListResponse) _then;

  /// Create a copy of FavoriteListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? favoriteList = null,
  }) {
    return _then(_FavoriteListResponse(
      favoriteList: null == favoriteList
          ? _self._favoriteList
          : favoriteList // ignore: cast_nullable_to_non_nullable
              as List<FavoriteListItem>,
    ));
  }
}

/// @nodoc
mixin _$FavoriteListItem {
  int get id;
  String get code;

  /// Create a copy of FavoriteListItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FavoriteListItemCopyWith<FavoriteListItem> get copyWith =>
      _$FavoriteListItemCopyWithImpl<FavoriteListItem>(
          this as FavoriteListItem, _$identity);

  /// Serializes this FavoriteListItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FavoriteListItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, code);

  @override
  String toString() {
    return 'FavoriteListItem(id: $id, code: $code)';
  }
}

/// @nodoc
abstract mixin class $FavoriteListItemCopyWith<$Res> {
  factory $FavoriteListItemCopyWith(
          FavoriteListItem value, $Res Function(FavoriteListItem) _then) =
      _$FavoriteListItemCopyWithImpl;
  @useResult
  $Res call({int id, String code});
}

/// @nodoc
class _$FavoriteListItemCopyWithImpl<$Res>
    implements $FavoriteListItemCopyWith<$Res> {
  _$FavoriteListItemCopyWithImpl(this._self, this._then);

  final FavoriteListItem _self;
  final $Res Function(FavoriteListItem) _then;

  /// Create a copy of FavoriteListItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _FavoriteListItem implements FavoriteListItem {
  _FavoriteListItem({required this.id, required this.code});
  factory _FavoriteListItem.fromJson(Map<String, dynamic> json) =>
      _$FavoriteListItemFromJson(json);

  @override
  final int id;
  @override
  final String code;

  /// Create a copy of FavoriteListItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FavoriteListItemCopyWith<_FavoriteListItem> get copyWith =>
      __$FavoriteListItemCopyWithImpl<_FavoriteListItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FavoriteListItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FavoriteListItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, code);

  @override
  String toString() {
    return 'FavoriteListItem(id: $id, code: $code)';
  }
}

/// @nodoc
abstract mixin class _$FavoriteListItemCopyWith<$Res>
    implements $FavoriteListItemCopyWith<$Res> {
  factory _$FavoriteListItemCopyWith(
          _FavoriteListItem value, $Res Function(_FavoriteListItem) _then) =
      __$FavoriteListItemCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String code});
}

/// @nodoc
class __$FavoriteListItemCopyWithImpl<$Res>
    implements _$FavoriteListItemCopyWith<$Res> {
  __$FavoriteListItemCopyWithImpl(this._self, this._then);

  final _FavoriteListItem _self;
  final $Res Function(_FavoriteListItem) _then;

  /// Create a copy of FavoriteListItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? code = null,
  }) {
    return _then(_FavoriteListItem(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
