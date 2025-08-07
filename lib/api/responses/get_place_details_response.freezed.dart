// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_place_details_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetPlaceDetailsResponse {
  String get id;
  String get name;
  String get address;
  double get latitude;
  double get longitude;
  double? get rating;
  int? get userRatingsTotal;
  String? get website;
  List<Review> get reviews;
  List<String> get weekdayDescriptions;
  bool get openNow;
  List<Photo>? get photos;

  /// Create a copy of GetPlaceDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetPlaceDetailsResponseCopyWith<GetPlaceDetailsResponse> get copyWith =>
      _$GetPlaceDetailsResponseCopyWithImpl<GetPlaceDetailsResponse>(
          this as GetPlaceDetailsResponse, _$identity);

  /// Serializes this GetPlaceDetailsResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetPlaceDetailsResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.userRatingsTotal, userRatingsTotal) ||
                other.userRatingsTotal == userRatingsTotal) &&
            (identical(other.website, website) || other.website == website) &&
            const DeepCollectionEquality().equals(other.reviews, reviews) &&
            const DeepCollectionEquality()
                .equals(other.weekdayDescriptions, weekdayDescriptions) &&
            (identical(other.openNow, openNow) || other.openNow == openNow) &&
            const DeepCollectionEquality().equals(other.photos, photos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      address,
      latitude,
      longitude,
      rating,
      userRatingsTotal,
      website,
      const DeepCollectionEquality().hash(reviews),
      const DeepCollectionEquality().hash(weekdayDescriptions),
      openNow,
      const DeepCollectionEquality().hash(photos));

  @override
  String toString() {
    return 'GetPlaceDetailsResponse(id: $id, name: $name, address: $address, latitude: $latitude, longitude: $longitude, rating: $rating, userRatingsTotal: $userRatingsTotal, website: $website, reviews: $reviews, weekdayDescriptions: $weekdayDescriptions, openNow: $openNow, photos: $photos)';
  }
}

/// @nodoc
abstract mixin class $GetPlaceDetailsResponseCopyWith<$Res> {
  factory $GetPlaceDetailsResponseCopyWith(GetPlaceDetailsResponse value,
          $Res Function(GetPlaceDetailsResponse) _then) =
      _$GetPlaceDetailsResponseCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String address,
      double latitude,
      double longitude,
      double? rating,
      int? userRatingsTotal,
      String? website,
      List<Review> reviews,
      List<String> weekdayDescriptions,
      bool openNow,
      List<Photo>? photos});
}

/// @nodoc
class _$GetPlaceDetailsResponseCopyWithImpl<$Res>
    implements $GetPlaceDetailsResponseCopyWith<$Res> {
  _$GetPlaceDetailsResponseCopyWithImpl(this._self, this._then);

  final GetPlaceDetailsResponse _self;
  final $Res Function(GetPlaceDetailsResponse) _then;

  /// Create a copy of GetPlaceDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? rating = freezed,
    Object? userRatingsTotal = freezed,
    Object? website = freezed,
    Object? reviews = null,
    Object? weekdayDescriptions = null,
    Object? openNow = null,
    Object? photos = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      userRatingsTotal: freezed == userRatingsTotal
          ? _self.userRatingsTotal
          : userRatingsTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      website: freezed == website
          ? _self.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      reviews: null == reviews
          ? _self.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>,
      weekdayDescriptions: null == weekdayDescriptions
          ? _self.weekdayDescriptions
          : weekdayDescriptions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      openNow: null == openNow
          ? _self.openNow
          : openNow // ignore: cast_nullable_to_non_nullable
              as bool,
      photos: freezed == photos
          ? _self.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photo>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [GetPlaceDetailsResponse].
extension GetPlaceDetailsResponsePatterns on GetPlaceDetailsResponse {
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
    TResult Function(_GetPlaceDetailsResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GetPlaceDetailsResponse() when $default != null:
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
    TResult Function(_GetPlaceDetailsResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GetPlaceDetailsResponse():
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
    TResult? Function(_GetPlaceDetailsResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GetPlaceDetailsResponse() when $default != null:
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
    TResult Function(
            String id,
            String name,
            String address,
            double latitude,
            double longitude,
            double? rating,
            int? userRatingsTotal,
            String? website,
            List<Review> reviews,
            List<String> weekdayDescriptions,
            bool openNow,
            List<Photo>? photos)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GetPlaceDetailsResponse() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.address,
            _that.latitude,
            _that.longitude,
            _that.rating,
            _that.userRatingsTotal,
            _that.website,
            _that.reviews,
            _that.weekdayDescriptions,
            _that.openNow,
            _that.photos);
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
    TResult Function(
            String id,
            String name,
            String address,
            double latitude,
            double longitude,
            double? rating,
            int? userRatingsTotal,
            String? website,
            List<Review> reviews,
            List<String> weekdayDescriptions,
            bool openNow,
            List<Photo>? photos)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GetPlaceDetailsResponse():
        return $default(
            _that.id,
            _that.name,
            _that.address,
            _that.latitude,
            _that.longitude,
            _that.rating,
            _that.userRatingsTotal,
            _that.website,
            _that.reviews,
            _that.weekdayDescriptions,
            _that.openNow,
            _that.photos);
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
    TResult? Function(
            String id,
            String name,
            String address,
            double latitude,
            double longitude,
            double? rating,
            int? userRatingsTotal,
            String? website,
            List<Review> reviews,
            List<String> weekdayDescriptions,
            bool openNow,
            List<Photo>? photos)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GetPlaceDetailsResponse() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.address,
            _that.latitude,
            _that.longitude,
            _that.rating,
            _that.userRatingsTotal,
            _that.website,
            _that.reviews,
            _that.weekdayDescriptions,
            _that.openNow,
            _that.photos);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GetPlaceDetailsResponse implements GetPlaceDetailsResponse {
  const _GetPlaceDetailsResponse(
      {required this.id,
      required this.name,
      required this.address,
      required this.latitude,
      required this.longitude,
      this.rating,
      this.userRatingsTotal,
      this.website,
      required final List<Review> reviews,
      required final List<String> weekdayDescriptions,
      required this.openNow,
      final List<Photo>? photos})
      : _reviews = reviews,
        _weekdayDescriptions = weekdayDescriptions,
        _photos = photos;
  factory _GetPlaceDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPlaceDetailsResponseFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String address;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double? rating;
  @override
  final int? userRatingsTotal;
  @override
  final String? website;
  final List<Review> _reviews;
  @override
  List<Review> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  final List<String> _weekdayDescriptions;
  @override
  List<String> get weekdayDescriptions {
    if (_weekdayDescriptions is EqualUnmodifiableListView)
      return _weekdayDescriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weekdayDescriptions);
  }

  @override
  final bool openNow;
  final List<Photo>? _photos;
  @override
  List<Photo>? get photos {
    final value = _photos;
    if (value == null) return null;
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of GetPlaceDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GetPlaceDetailsResponseCopyWith<_GetPlaceDetailsResponse> get copyWith =>
      __$GetPlaceDetailsResponseCopyWithImpl<_GetPlaceDetailsResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GetPlaceDetailsResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetPlaceDetailsResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.userRatingsTotal, userRatingsTotal) ||
                other.userRatingsTotal == userRatingsTotal) &&
            (identical(other.website, website) || other.website == website) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            const DeepCollectionEquality()
                .equals(other._weekdayDescriptions, _weekdayDescriptions) &&
            (identical(other.openNow, openNow) || other.openNow == openNow) &&
            const DeepCollectionEquality().equals(other._photos, _photos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      address,
      latitude,
      longitude,
      rating,
      userRatingsTotal,
      website,
      const DeepCollectionEquality().hash(_reviews),
      const DeepCollectionEquality().hash(_weekdayDescriptions),
      openNow,
      const DeepCollectionEquality().hash(_photos));

  @override
  String toString() {
    return 'GetPlaceDetailsResponse(id: $id, name: $name, address: $address, latitude: $latitude, longitude: $longitude, rating: $rating, userRatingsTotal: $userRatingsTotal, website: $website, reviews: $reviews, weekdayDescriptions: $weekdayDescriptions, openNow: $openNow, photos: $photos)';
  }
}

/// @nodoc
abstract mixin class _$GetPlaceDetailsResponseCopyWith<$Res>
    implements $GetPlaceDetailsResponseCopyWith<$Res> {
  factory _$GetPlaceDetailsResponseCopyWith(_GetPlaceDetailsResponse value,
          $Res Function(_GetPlaceDetailsResponse) _then) =
      __$GetPlaceDetailsResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String address,
      double latitude,
      double longitude,
      double? rating,
      int? userRatingsTotal,
      String? website,
      List<Review> reviews,
      List<String> weekdayDescriptions,
      bool openNow,
      List<Photo>? photos});
}

/// @nodoc
class __$GetPlaceDetailsResponseCopyWithImpl<$Res>
    implements _$GetPlaceDetailsResponseCopyWith<$Res> {
  __$GetPlaceDetailsResponseCopyWithImpl(this._self, this._then);

  final _GetPlaceDetailsResponse _self;
  final $Res Function(_GetPlaceDetailsResponse) _then;

  /// Create a copy of GetPlaceDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? rating = freezed,
    Object? userRatingsTotal = freezed,
    Object? website = freezed,
    Object? reviews = null,
    Object? weekdayDescriptions = null,
    Object? openNow = null,
    Object? photos = freezed,
  }) {
    return _then(_GetPlaceDetailsResponse(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      userRatingsTotal: freezed == userRatingsTotal
          ? _self.userRatingsTotal
          : userRatingsTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      website: freezed == website
          ? _self.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      reviews: null == reviews
          ? _self._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>,
      weekdayDescriptions: null == weekdayDescriptions
          ? _self._weekdayDescriptions
          : weekdayDescriptions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      openNow: null == openNow
          ? _self.openNow
          : openNow // ignore: cast_nullable_to_non_nullable
              as bool,
      photos: freezed == photos
          ? _self._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photo>?,
    ));
  }
}

// dart format on
