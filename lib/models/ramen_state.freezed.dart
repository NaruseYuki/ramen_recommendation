// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ramen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RamenState<T> {
  File? get imageFile;
  String? get result;
  bool get isLoading; // デフォルト値: false
  AppErrorCode? get error;
  List<T> get places; // デフォルト値: 空のリスト
  Set<String> get favoritePlaceIds; // デフォルト値: 空のセット
  Map<String, GetPlaceDetailsResponse> get detail;

  /// Create a copy of RamenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RamenStateCopyWith<T, RamenState<T>> get copyWith =>
      _$RamenStateCopyWithImpl<T, RamenState<T>>(
          this as RamenState<T>, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RamenState<T> &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other.places, places) &&
            const DeepCollectionEquality()
                .equals(other.favoritePlaceIds, favoritePlaceIds) &&
            const DeepCollectionEquality().equals(other.detail, detail));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      imageFile,
      result,
      isLoading,
      error,
      const DeepCollectionEquality().hash(places),
      const DeepCollectionEquality().hash(favoritePlaceIds),
      const DeepCollectionEquality().hash(detail));

  @override
  String toString() {
    return 'RamenState<$T>(imageFile: $imageFile, result: $result, isLoading: $isLoading, error: $error, places: $places, favoritePlaceIds: $favoritePlaceIds, detail: $detail)';
  }
}

/// @nodoc
abstract mixin class $RamenStateCopyWith<T, $Res> {
  factory $RamenStateCopyWith(
          RamenState<T> value, $Res Function(RamenState<T>) _then) =
      _$RamenStateCopyWithImpl;
  @useResult
  $Res call(
      {File? imageFile,
      String? result,
      bool isLoading,
      AppErrorCode? error,
      List<T> places,
      Set<String> favoritePlaceIds,
      Map<String, GetPlaceDetailsResponse> detail});
}

/// @nodoc
class _$RamenStateCopyWithImpl<T, $Res>
    implements $RamenStateCopyWith<T, $Res> {
  _$RamenStateCopyWithImpl(this._self, this._then);

  final RamenState<T> _self;
  final $Res Function(RamenState<T>) _then;

  /// Create a copy of RamenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageFile = freezed,
    Object? result = freezed,
    Object? isLoading = null,
    Object? error = freezed,
    Object? places = null,
    Object? favoritePlaceIds = null,
    Object? detail = null,
  }) {
    return _then(_self.copyWith(
      imageFile: freezed == imageFile
          ? _self.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
      result: freezed == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppErrorCode?,
      places: null == places
          ? _self.places
          : places // ignore: cast_nullable_to_non_nullable
              as List<T>,
      favoritePlaceIds: null == favoritePlaceIds
          ? _self.favoritePlaceIds
          : favoritePlaceIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      detail: null == detail
          ? _self.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as Map<String, GetPlaceDetailsResponse>,
    ));
  }
}

/// @nodoc

class _RamenState<T> extends RamenState<T> {
  const _RamenState(
      {this.imageFile,
      this.result,
      this.isLoading = false,
      this.error,
      final List<T> places = const [],
      final Set<String> favoritePlaceIds = const {},
      final Map<String, GetPlaceDetailsResponse> detail = const {}})
      : _places = places,
        _favoritePlaceIds = favoritePlaceIds,
        _detail = detail,
        super._();

  @override
  final File? imageFile;
  @override
  final String? result;
  @override
  @JsonKey()
  final bool isLoading;
// デフォルト値: false
  @override
  final AppErrorCode? error;
  final List<T> _places;
  @override
  @JsonKey()
  List<T> get places {
    if (_places is EqualUnmodifiableListView) return _places;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_places);
  }

// デフォルト値: 空のリスト
  final Set<String> _favoritePlaceIds;
// デフォルト値: 空のリスト
  @override
  @JsonKey()
  Set<String> get favoritePlaceIds {
    if (_favoritePlaceIds is EqualUnmodifiableSetView) return _favoritePlaceIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_favoritePlaceIds);
  }

// デフォルト値: 空のセット
  final Map<String, GetPlaceDetailsResponse> _detail;
// デフォルト値: 空のセット
  @override
  @JsonKey()
  Map<String, GetPlaceDetailsResponse> get detail {
    if (_detail is EqualUnmodifiableMapView) return _detail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_detail);
  }

  /// Create a copy of RamenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RamenStateCopyWith<T, _RamenState<T>> get copyWith =>
      __$RamenStateCopyWithImpl<T, _RamenState<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RamenState<T> &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._places, _places) &&
            const DeepCollectionEquality()
                .equals(other._favoritePlaceIds, _favoritePlaceIds) &&
            const DeepCollectionEquality().equals(other._detail, _detail));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      imageFile,
      result,
      isLoading,
      error,
      const DeepCollectionEquality().hash(_places),
      const DeepCollectionEquality().hash(_favoritePlaceIds),
      const DeepCollectionEquality().hash(_detail));

  @override
  String toString() {
    return 'RamenState<$T>(imageFile: $imageFile, result: $result, isLoading: $isLoading, error: $error, places: $places, favoritePlaceIds: $favoritePlaceIds, detail: $detail)';
  }
}

/// @nodoc
abstract mixin class _$RamenStateCopyWith<T, $Res>
    implements $RamenStateCopyWith<T, $Res> {
  factory _$RamenStateCopyWith(
          _RamenState<T> value, $Res Function(_RamenState<T>) _then) =
      __$RamenStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {File? imageFile,
      String? result,
      bool isLoading,
      AppErrorCode? error,
      List<T> places,
      Set<String> favoritePlaceIds,
      Map<String, GetPlaceDetailsResponse> detail});
}

/// @nodoc
class __$RamenStateCopyWithImpl<T, $Res>
    implements _$RamenStateCopyWith<T, $Res> {
  __$RamenStateCopyWithImpl(this._self, this._then);

  final _RamenState<T> _self;
  final $Res Function(_RamenState<T>) _then;

  /// Create a copy of RamenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? imageFile = freezed,
    Object? result = freezed,
    Object? isLoading = null,
    Object? error = freezed,
    Object? places = null,
    Object? favoritePlaceIds = null,
    Object? detail = null,
  }) {
    return _then(_RamenState<T>(
      imageFile: freezed == imageFile
          ? _self.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
      result: freezed == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppErrorCode?,
      places: null == places
          ? _self._places
          : places // ignore: cast_nullable_to_non_nullable
              as List<T>,
      favoritePlaceIds: null == favoritePlaceIds
          ? _self._favoritePlaceIds
          : favoritePlaceIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      detail: null == detail
          ? _self._detail
          : detail // ignore: cast_nullable_to_non_nullable
              as Map<String, GetPlaceDetailsResponse>,
    ));
  }
}

// dart format on
