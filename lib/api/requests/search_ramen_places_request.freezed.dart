// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_ramen_places_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchRamenPlacesRequest {
  String get keyword;
  double get latitude;
  double get longitude;
  int get pageSize;
  String get languageCode;
  double get radius;

  /// Create a copy of SearchRamenPlacesRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchRamenPlacesRequestCopyWith<SearchRamenPlacesRequest> get copyWith =>
      _$SearchRamenPlacesRequestCopyWithImpl<SearchRamenPlacesRequest>(
          this as SearchRamenPlacesRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchRamenPlacesRequest &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            (identical(other.radius, radius) || other.radius == radius));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, keyword, latitude, longitude,
      pageSize, languageCode, radius);

  @override
  String toString() {
    return 'SearchRamenPlacesRequest(keyword: $keyword, latitude: $latitude, longitude: $longitude, pageSize: $pageSize, languageCode: $languageCode, radius: $radius)';
  }
}

/// @nodoc
abstract mixin class $SearchRamenPlacesRequestCopyWith<$Res> {
  factory $SearchRamenPlacesRequestCopyWith(SearchRamenPlacesRequest value,
          $Res Function(SearchRamenPlacesRequest) _then) =
      _$SearchRamenPlacesRequestCopyWithImpl;
  @useResult
  $Res call(
      {String keyword,
      double latitude,
      double longitude,
      int pageSize,
      String languageCode,
      double radius});
}

/// @nodoc
class _$SearchRamenPlacesRequestCopyWithImpl<$Res>
    implements $SearchRamenPlacesRequestCopyWith<$Res> {
  _$SearchRamenPlacesRequestCopyWithImpl(this._self, this._then);

  final SearchRamenPlacesRequest _self;
  final $Res Function(SearchRamenPlacesRequest) _then;

  /// Create a copy of SearchRamenPlacesRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? pageSize = null,
    Object? languageCode = null,
    Object? radius = null,
  }) {
    return _then(_self.copyWith(
      keyword: null == keyword
          ? _self.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      pageSize: null == pageSize
          ? _self.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      languageCode: null == languageCode
          ? _self.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      radius: null == radius
          ? _self.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [SearchRamenPlacesRequest].
extension SearchRamenPlacesRequestPatterns on SearchRamenPlacesRequest {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SearchRamenPlacesRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchRamenPlacesRequest() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SearchRamenPlacesRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchRamenPlacesRequest():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SearchRamenPlacesRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchRamenPlacesRequest() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String keyword, double latitude, double longitude,
            int pageSize, String languageCode, double radius)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchRamenPlacesRequest() when $default != null:
        return $default(_that.keyword, _that.latitude, _that.longitude,
            _that.pageSize, _that.languageCode, _that.radius);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String keyword, double latitude, double longitude,
            int pageSize, String languageCode, double radius)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchRamenPlacesRequest():
        return $default(_that.keyword, _that.latitude, _that.longitude,
            _that.pageSize, _that.languageCode, _that.radius);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String keyword, double latitude, double longitude,
            int pageSize, String languageCode, double radius)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchRamenPlacesRequest() when $default != null:
        return $default(_that.keyword, _that.latitude, _that.longitude,
            _that.pageSize, _that.languageCode, _that.radius);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _SearchRamenPlacesRequest implements SearchRamenPlacesRequest {
  const _SearchRamenPlacesRequest(
      {required this.keyword,
      required this.latitude,
      required this.longitude,
      this.pageSize = 10,
      this.languageCode = 'ja',
      this.radius = 500.0});
  factory _SearchRamenPlacesRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchRamenPlacesRequestFromJson(json);

  @override
  final String keyword;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  @JsonKey()
  final int pageSize;
  @override
  @JsonKey()
  final String languageCode;
  @override
  @JsonKey()
  final double radius;

  /// Create a copy of SearchRamenPlacesRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchRamenPlacesRequestCopyWith<_SearchRamenPlacesRequest> get copyWith =>
      __$SearchRamenPlacesRequestCopyWithImpl<_SearchRamenPlacesRequest>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchRamenPlacesRequest &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            (identical(other.radius, radius) || other.radius == radius));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, keyword, latitude, longitude,
      pageSize, languageCode, radius);

  @override
  String toString() {
    return 'SearchRamenPlacesRequest(keyword: $keyword, latitude: $latitude, longitude: $longitude, pageSize: $pageSize, languageCode: $languageCode, radius: $radius)';
  }
}

/// @nodoc
abstract mixin class _$SearchRamenPlacesRequestCopyWith<$Res>
    implements $SearchRamenPlacesRequestCopyWith<$Res> {
  factory _$SearchRamenPlacesRequestCopyWith(_SearchRamenPlacesRequest value,
          $Res Function(_SearchRamenPlacesRequest) _then) =
      __$SearchRamenPlacesRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String keyword,
      double latitude,
      double longitude,
      int pageSize,
      String languageCode,
      double radius});
}

/// @nodoc
class __$SearchRamenPlacesRequestCopyWithImpl<$Res>
    implements _$SearchRamenPlacesRequestCopyWith<$Res> {
  __$SearchRamenPlacesRequestCopyWithImpl(this._self, this._then);

  final _SearchRamenPlacesRequest _self;
  final $Res Function(_SearchRamenPlacesRequest) _then;

  /// Create a copy of SearchRamenPlacesRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? keyword = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? pageSize = null,
    Object? languageCode = null,
    Object? radius = null,
  }) {
    return _then(_SearchRamenPlacesRequest(
      keyword: null == keyword
          ? _self.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      pageSize: null == pageSize
          ? _self.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      languageCode: null == languageCode
          ? _self.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      radius: null == radius
          ? _self.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
