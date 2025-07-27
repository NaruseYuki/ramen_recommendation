// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ramen_place.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RamenPlace {
  String get id;
  @JsonKey(name: 'displayName')
  DisplayName get displayName;
  @JsonKey(name: 'formattedAddress')
  String get address;
  @JsonKey(name: 'location')
  Location get location;
  @JsonKey(name: 'photos')
  List<Photo>? get photos;

  /// Create a copy of RamenPlace
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RamenPlaceCopyWith<RamenPlace> get copyWith =>
      _$RamenPlaceCopyWithImpl<RamenPlace>(this as RamenPlace, _$identity);

  /// Serializes this RamenPlace to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RamenPlace &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(other.photos, photos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, displayName, address,
      location, const DeepCollectionEquality().hash(photos));

  @override
  String toString() {
    return 'RamenPlace(id: $id, displayName: $displayName, address: $address, location: $location, photos: $photos)';
  }
}

/// @nodoc
abstract mixin class $RamenPlaceCopyWith<$Res> {
  factory $RamenPlaceCopyWith(
          RamenPlace value, $Res Function(RamenPlace) _then) =
      _$RamenPlaceCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'displayName') DisplayName displayName,
      @JsonKey(name: 'formattedAddress') String address,
      @JsonKey(name: 'location') Location location,
      @JsonKey(name: 'photos') List<Photo>? photos});

  $DisplayNameCopyWith<$Res> get displayName;
  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class _$RamenPlaceCopyWithImpl<$Res> implements $RamenPlaceCopyWith<$Res> {
  _$RamenPlaceCopyWithImpl(this._self, this._then);

  final RamenPlace _self;
  final $Res Function(RamenPlace) _then;

  /// Create a copy of RamenPlace
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? address = null,
    Object? location = null,
    Object? photos = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as DisplayName,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      photos: freezed == photos
          ? _self.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photo>?,
    ));
  }

  /// Create a copy of RamenPlace
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DisplayNameCopyWith<$Res> get displayName {
    return $DisplayNameCopyWith<$Res>(_self.displayName, (value) {
      return _then(_self.copyWith(displayName: value));
    });
  }

  /// Create a copy of RamenPlace
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_self.location, (value) {
      return _then(_self.copyWith(location: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RamenPlace].
extension RamenPlacePatterns on RamenPlace {
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
    TResult Function(_RamenPlace value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RamenPlace() when $default != null:
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
    TResult Function(_RamenPlace value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RamenPlace():
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
    TResult? Function(_RamenPlace value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RamenPlace() when $default != null:
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
            @JsonKey(name: 'displayName') DisplayName displayName,
            @JsonKey(name: 'formattedAddress') String address,
            @JsonKey(name: 'location') Location location,
            @JsonKey(name: 'photos') List<Photo>? photos)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RamenPlace() when $default != null:
        return $default(_that.id, _that.displayName, _that.address,
            _that.location, _that.photos);
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
            @JsonKey(name: 'displayName') DisplayName displayName,
            @JsonKey(name: 'formattedAddress') String address,
            @JsonKey(name: 'location') Location location,
            @JsonKey(name: 'photos') List<Photo>? photos)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RamenPlace():
        return $default(_that.id, _that.displayName, _that.address,
            _that.location, _that.photos);
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
            @JsonKey(name: 'displayName') DisplayName displayName,
            @JsonKey(name: 'formattedAddress') String address,
            @JsonKey(name: 'location') Location location,
            @JsonKey(name: 'photos') List<Photo>? photos)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RamenPlace() when $default != null:
        return $default(_that.id, _that.displayName, _that.address,
            _that.location, _that.photos);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RamenPlace implements RamenPlace {
  const _RamenPlace(
      {required this.id,
      @JsonKey(name: 'displayName') required this.displayName,
      @JsonKey(name: 'formattedAddress') required this.address,
      @JsonKey(name: 'location') required this.location,
      @JsonKey(name: 'photos') final List<Photo>? photos})
      : _photos = photos;
  factory _RamenPlace.fromJson(Map<String, dynamic> json) =>
      _$RamenPlaceFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'displayName')
  final DisplayName displayName;
  @override
  @JsonKey(name: 'formattedAddress')
  final String address;
  @override
  @JsonKey(name: 'location')
  final Location location;
  final List<Photo>? _photos;
  @override
  @JsonKey(name: 'photos')
  List<Photo>? get photos {
    final value = _photos;
    if (value == null) return null;
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of RamenPlace
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RamenPlaceCopyWith<_RamenPlace> get copyWith =>
      __$RamenPlaceCopyWithImpl<_RamenPlace>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RamenPlaceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RamenPlace &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(other._photos, _photos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, displayName, address,
      location, const DeepCollectionEquality().hash(_photos));

  @override
  String toString() {
    return 'RamenPlace(id: $id, displayName: $displayName, address: $address, location: $location, photos: $photos)';
  }
}

/// @nodoc
abstract mixin class _$RamenPlaceCopyWith<$Res>
    implements $RamenPlaceCopyWith<$Res> {
  factory _$RamenPlaceCopyWith(
          _RamenPlace value, $Res Function(_RamenPlace) _then) =
      __$RamenPlaceCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'displayName') DisplayName displayName,
      @JsonKey(name: 'formattedAddress') String address,
      @JsonKey(name: 'location') Location location,
      @JsonKey(name: 'photos') List<Photo>? photos});

  @override
  $DisplayNameCopyWith<$Res> get displayName;
  @override
  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class __$RamenPlaceCopyWithImpl<$Res> implements _$RamenPlaceCopyWith<$Res> {
  __$RamenPlaceCopyWithImpl(this._self, this._then);

  final _RamenPlace _self;
  final $Res Function(_RamenPlace) _then;

  /// Create a copy of RamenPlace
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? address = null,
    Object? location = null,
    Object? photos = freezed,
  }) {
    return _then(_RamenPlace(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as DisplayName,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      photos: freezed == photos
          ? _self._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photo>?,
    ));
  }

  /// Create a copy of RamenPlace
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DisplayNameCopyWith<$Res> get displayName {
    return $DisplayNameCopyWith<$Res>(_self.displayName, (value) {
      return _then(_self.copyWith(displayName: value));
    });
  }

  /// Create a copy of RamenPlace
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_self.location, (value) {
      return _then(_self.copyWith(location: value));
    });
  }
}

/// @nodoc
mixin _$DisplayName {
  String get text;

  /// Create a copy of DisplayName
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DisplayNameCopyWith<DisplayName> get copyWith =>
      _$DisplayNameCopyWithImpl<DisplayName>(this as DisplayName, _$identity);

  /// Serializes this DisplayName to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DisplayName &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text);

  @override
  String toString() {
    return 'DisplayName(text: $text)';
  }
}

/// @nodoc
abstract mixin class $DisplayNameCopyWith<$Res> {
  factory $DisplayNameCopyWith(
          DisplayName value, $Res Function(DisplayName) _then) =
      _$DisplayNameCopyWithImpl;
  @useResult
  $Res call({String text});
}

/// @nodoc
class _$DisplayNameCopyWithImpl<$Res> implements $DisplayNameCopyWith<$Res> {
  _$DisplayNameCopyWithImpl(this._self, this._then);

  final DisplayName _self;
  final $Res Function(DisplayName) _then;

  /// Create a copy of DisplayName
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_self.copyWith(
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [DisplayName].
extension DisplayNamePatterns on DisplayName {
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
    TResult Function(_DisplayName value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DisplayName() when $default != null:
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
    TResult Function(_DisplayName value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DisplayName():
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
    TResult? Function(_DisplayName value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DisplayName() when $default != null:
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
    TResult Function(String text)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DisplayName() when $default != null:
        return $default(_that.text);
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
    TResult Function(String text) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DisplayName():
        return $default(_that.text);
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
    TResult? Function(String text)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DisplayName() when $default != null:
        return $default(_that.text);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DisplayName implements DisplayName {
  const _DisplayName({required this.text});
  factory _DisplayName.fromJson(Map<String, dynamic> json) =>
      _$DisplayNameFromJson(json);

  @override
  final String text;

  /// Create a copy of DisplayName
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DisplayNameCopyWith<_DisplayName> get copyWith =>
      __$DisplayNameCopyWithImpl<_DisplayName>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DisplayNameToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DisplayName &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text);

  @override
  String toString() {
    return 'DisplayName(text: $text)';
  }
}

/// @nodoc
abstract mixin class _$DisplayNameCopyWith<$Res>
    implements $DisplayNameCopyWith<$Res> {
  factory _$DisplayNameCopyWith(
          _DisplayName value, $Res Function(_DisplayName) _then) =
      __$DisplayNameCopyWithImpl;
  @override
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$DisplayNameCopyWithImpl<$Res> implements _$DisplayNameCopyWith<$Res> {
  __$DisplayNameCopyWithImpl(this._self, this._then);

  final _DisplayName _self;
  final $Res Function(_DisplayName) _then;

  /// Create a copy of DisplayName
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? text = null,
  }) {
    return _then(_DisplayName(
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$Location {
  double get latitude;
  double get longitude;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocationCopyWith<Location> get copyWith =>
      _$LocationCopyWithImpl<Location>(this as Location, _$identity);

  /// Serializes this Location to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Location &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @override
  String toString() {
    return 'Location(latitude: $latitude, longitude: $longitude)';
  }
}

/// @nodoc
abstract mixin class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) _then) =
      _$LocationCopyWithImpl;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res> implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._self, this._then);

  final Location _self;
  final $Res Function(Location) _then;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_self.copyWith(
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [Location].
extension LocationPatterns on Location {
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
    TResult Function(_Location value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Location() when $default != null:
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
    TResult Function(_Location value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Location():
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
    TResult? Function(_Location value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Location() when $default != null:
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
    TResult Function(double latitude, double longitude)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Location() when $default != null:
        return $default(_that.latitude, _that.longitude);
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
    TResult Function(double latitude, double longitude) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Location():
        return $default(_that.latitude, _that.longitude);
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
    TResult? Function(double latitude, double longitude)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Location() when $default != null:
        return $default(_that.latitude, _that.longitude);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Location implements Location {
  const _Location({required this.latitude, required this.longitude});
  factory _Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocationCopyWith<_Location> get copyWith =>
      __$LocationCopyWithImpl<_Location>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LocationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Location &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @override
  String toString() {
    return 'Location(latitude: $latitude, longitude: $longitude)';
  }
}

/// @nodoc
abstract mixin class _$LocationCopyWith<$Res>
    implements $LocationCopyWith<$Res> {
  factory _$LocationCopyWith(_Location value, $Res Function(_Location) _then) =
      __$LocationCopyWithImpl;
  @override
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$LocationCopyWithImpl<$Res> implements _$LocationCopyWith<$Res> {
  __$LocationCopyWithImpl(this._self, this._then);

  final _Location _self;
  final $Res Function(_Location) _then;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_Location(
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$Photo {
  String get name;
  int get widthPx;
  int get heightPx;
  List<AuthorAttribution>? get authorAttributions;

  /// Create a copy of Photo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PhotoCopyWith<Photo> get copyWith =>
      _$PhotoCopyWithImpl<Photo>(this as Photo, _$identity);

  /// Serializes this Photo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Photo &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.widthPx, widthPx) || other.widthPx == widthPx) &&
            (identical(other.heightPx, heightPx) ||
                other.heightPx == heightPx) &&
            const DeepCollectionEquality()
                .equals(other.authorAttributions, authorAttributions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, widthPx, heightPx,
      const DeepCollectionEquality().hash(authorAttributions));

  @override
  String toString() {
    return 'Photo(name: $name, widthPx: $widthPx, heightPx: $heightPx, authorAttributions: $authorAttributions)';
  }
}

/// @nodoc
abstract mixin class $PhotoCopyWith<$Res> {
  factory $PhotoCopyWith(Photo value, $Res Function(Photo) _then) =
      _$PhotoCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      int widthPx,
      int heightPx,
      List<AuthorAttribution>? authorAttributions});
}

/// @nodoc
class _$PhotoCopyWithImpl<$Res> implements $PhotoCopyWith<$Res> {
  _$PhotoCopyWithImpl(this._self, this._then);

  final Photo _self;
  final $Res Function(Photo) _then;

  /// Create a copy of Photo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? widthPx = null,
    Object? heightPx = null,
    Object? authorAttributions = freezed,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      widthPx: null == widthPx
          ? _self.widthPx
          : widthPx // ignore: cast_nullable_to_non_nullable
              as int,
      heightPx: null == heightPx
          ? _self.heightPx
          : heightPx // ignore: cast_nullable_to_non_nullable
              as int,
      authorAttributions: freezed == authorAttributions
          ? _self.authorAttributions
          : authorAttributions // ignore: cast_nullable_to_non_nullable
              as List<AuthorAttribution>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Photo].
extension PhotoPatterns on Photo {
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
    TResult Function(_Photo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Photo() when $default != null:
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
    TResult Function(_Photo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Photo():
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
    TResult? Function(_Photo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Photo() when $default != null:
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
    TResult Function(String name, int widthPx, int heightPx,
            List<AuthorAttribution>? authorAttributions)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Photo() when $default != null:
        return $default(_that.name, _that.widthPx, _that.heightPx,
            _that.authorAttributions);
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
    TResult Function(String name, int widthPx, int heightPx,
            List<AuthorAttribution>? authorAttributions)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Photo():
        return $default(_that.name, _that.widthPx, _that.heightPx,
            _that.authorAttributions);
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
    TResult? Function(String name, int widthPx, int heightPx,
            List<AuthorAttribution>? authorAttributions)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Photo() when $default != null:
        return $default(_that.name, _that.widthPx, _that.heightPx,
            _that.authorAttributions);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Photo implements Photo {
  const _Photo(
      {required this.name,
      required this.widthPx,
      required this.heightPx,
      final List<AuthorAttribution>? authorAttributions})
      : _authorAttributions = authorAttributions;
  factory _Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  @override
  final String name;
  @override
  final int widthPx;
  @override
  final int heightPx;
  final List<AuthorAttribution>? _authorAttributions;
  @override
  List<AuthorAttribution>? get authorAttributions {
    final value = _authorAttributions;
    if (value == null) return null;
    if (_authorAttributions is EqualUnmodifiableListView)
      return _authorAttributions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of Photo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PhotoCopyWith<_Photo> get copyWith =>
      __$PhotoCopyWithImpl<_Photo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PhotoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Photo &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.widthPx, widthPx) || other.widthPx == widthPx) &&
            (identical(other.heightPx, heightPx) ||
                other.heightPx == heightPx) &&
            const DeepCollectionEquality()
                .equals(other._authorAttributions, _authorAttributions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, widthPx, heightPx,
      const DeepCollectionEquality().hash(_authorAttributions));

  @override
  String toString() {
    return 'Photo(name: $name, widthPx: $widthPx, heightPx: $heightPx, authorAttributions: $authorAttributions)';
  }
}

/// @nodoc
abstract mixin class _$PhotoCopyWith<$Res> implements $PhotoCopyWith<$Res> {
  factory _$PhotoCopyWith(_Photo value, $Res Function(_Photo) _then) =
      __$PhotoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      int widthPx,
      int heightPx,
      List<AuthorAttribution>? authorAttributions});
}

/// @nodoc
class __$PhotoCopyWithImpl<$Res> implements _$PhotoCopyWith<$Res> {
  __$PhotoCopyWithImpl(this._self, this._then);

  final _Photo _self;
  final $Res Function(_Photo) _then;

  /// Create a copy of Photo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? widthPx = null,
    Object? heightPx = null,
    Object? authorAttributions = freezed,
  }) {
    return _then(_Photo(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      widthPx: null == widthPx
          ? _self.widthPx
          : widthPx // ignore: cast_nullable_to_non_nullable
              as int,
      heightPx: null == heightPx
          ? _self.heightPx
          : heightPx // ignore: cast_nullable_to_non_nullable
              as int,
      authorAttributions: freezed == authorAttributions
          ? _self._authorAttributions
          : authorAttributions // ignore: cast_nullable_to_non_nullable
              as List<AuthorAttribution>?,
    ));
  }
}

/// @nodoc
mixin _$AuthorAttribution {
  String get displayName;
  String? get uri;
  String? get photoUri;

  /// Create a copy of AuthorAttribution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthorAttributionCopyWith<AuthorAttribution> get copyWith =>
      _$AuthorAttributionCopyWithImpl<AuthorAttribution>(
          this as AuthorAttribution, _$identity);

  /// Serializes this AuthorAttribution to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthorAttribution &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.photoUri, photoUri) ||
                other.photoUri == photoUri));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, displayName, uri, photoUri);

  @override
  String toString() {
    return 'AuthorAttribution(displayName: $displayName, uri: $uri, photoUri: $photoUri)';
  }
}

/// @nodoc
abstract mixin class $AuthorAttributionCopyWith<$Res> {
  factory $AuthorAttributionCopyWith(
          AuthorAttribution value, $Res Function(AuthorAttribution) _then) =
      _$AuthorAttributionCopyWithImpl;
  @useResult
  $Res call({String displayName, String? uri, String? photoUri});
}

/// @nodoc
class _$AuthorAttributionCopyWithImpl<$Res>
    implements $AuthorAttributionCopyWith<$Res> {
  _$AuthorAttributionCopyWithImpl(this._self, this._then);

  final AuthorAttribution _self;
  final $Res Function(AuthorAttribution) _then;

  /// Create a copy of AuthorAttribution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? uri = freezed,
    Object? photoUri = freezed,
  }) {
    return _then(_self.copyWith(
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      uri: freezed == uri
          ? _self.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUri: freezed == photoUri
          ? _self.photoUri
          : photoUri // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [AuthorAttribution].
extension AuthorAttributionPatterns on AuthorAttribution {
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
    TResult Function(_AuthorAttribution value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthorAttribution() when $default != null:
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
    TResult Function(_AuthorAttribution value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthorAttribution():
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
    TResult? Function(_AuthorAttribution value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthorAttribution() when $default != null:
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
    TResult Function(String displayName, String? uri, String? photoUri)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthorAttribution() when $default != null:
        return $default(_that.displayName, _that.uri, _that.photoUri);
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
    TResult Function(String displayName, String? uri, String? photoUri)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthorAttribution():
        return $default(_that.displayName, _that.uri, _that.photoUri);
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
    TResult? Function(String displayName, String? uri, String? photoUri)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthorAttribution() when $default != null:
        return $default(_that.displayName, _that.uri, _that.photoUri);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AuthorAttribution implements AuthorAttribution {
  const _AuthorAttribution(
      {required this.displayName, this.uri, this.photoUri});
  factory _AuthorAttribution.fromJson(Map<String, dynamic> json) =>
      _$AuthorAttributionFromJson(json);

  @override
  final String displayName;
  @override
  final String? uri;
  @override
  final String? photoUri;

  /// Create a copy of AuthorAttribution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthorAttributionCopyWith<_AuthorAttribution> get copyWith =>
      __$AuthorAttributionCopyWithImpl<_AuthorAttribution>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AuthorAttributionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthorAttribution &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.photoUri, photoUri) ||
                other.photoUri == photoUri));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, displayName, uri, photoUri);

  @override
  String toString() {
    return 'AuthorAttribution(displayName: $displayName, uri: $uri, photoUri: $photoUri)';
  }
}

/// @nodoc
abstract mixin class _$AuthorAttributionCopyWith<$Res>
    implements $AuthorAttributionCopyWith<$Res> {
  factory _$AuthorAttributionCopyWith(
          _AuthorAttribution value, $Res Function(_AuthorAttribution) _then) =
      __$AuthorAttributionCopyWithImpl;
  @override
  @useResult
  $Res call({String displayName, String? uri, String? photoUri});
}

/// @nodoc
class __$AuthorAttributionCopyWithImpl<$Res>
    implements _$AuthorAttributionCopyWith<$Res> {
  __$AuthorAttributionCopyWithImpl(this._self, this._then);

  final _AuthorAttribution _self;
  final $Res Function(_AuthorAttribution) _then;

  /// Create a copy of AuthorAttribution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? displayName = null,
    Object? uri = freezed,
    Object? photoUri = freezed,
  }) {
    return _then(_AuthorAttribution(
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      uri: freezed == uri
          ? _self.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUri: freezed == photoUri
          ? _self.photoUri
          : photoUri // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
