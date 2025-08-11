// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_photo_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlacePhotoResponse {
  String get name;
  String get photoUri;

  /// Create a copy of PlacePhotoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlacePhotoResponseCopyWith<PlacePhotoResponse> get copyWith =>
      _$PlacePhotoResponseCopyWithImpl<PlacePhotoResponse>(
          this as PlacePhotoResponse, _$identity);

  /// Serializes this PlacePhotoResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlacePhotoResponse &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.photoUri, photoUri) ||
                other.photoUri == photoUri));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, photoUri);

  @override
  String toString() {
    return 'PlacePhotoResponse(name: $name, photoUri: $photoUri)';
  }
}

/// @nodoc
abstract mixin class $PlacePhotoResponseCopyWith<$Res> {
  factory $PlacePhotoResponseCopyWith(
          PlacePhotoResponse value, $Res Function(PlacePhotoResponse) _then) =
      _$PlacePhotoResponseCopyWithImpl;
  @useResult
  $Res call({String name, String photoUri});
}

/// @nodoc
class _$PlacePhotoResponseCopyWithImpl<$Res>
    implements $PlacePhotoResponseCopyWith<$Res> {
  _$PlacePhotoResponseCopyWithImpl(this._self, this._then);

  final PlacePhotoResponse _self;
  final $Res Function(PlacePhotoResponse) _then;

  /// Create a copy of PlacePhotoResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? photoUri = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUri: null == photoUri
          ? _self.photoUri
          : photoUri // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [PlacePhotoResponse].
extension PlacePhotoResponsePatterns on PlacePhotoResponse {
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
    TResult Function(_PlacePhotoResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlacePhotoResponse() when $default != null:
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
    TResult Function(_PlacePhotoResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlacePhotoResponse():
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
    TResult? Function(_PlacePhotoResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlacePhotoResponse() when $default != null:
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
    TResult Function(String name, String photoUri)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlacePhotoResponse() when $default != null:
        return $default(_that.name, _that.photoUri);
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
    TResult Function(String name, String photoUri) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlacePhotoResponse():
        return $default(_that.name, _that.photoUri);
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
    TResult? Function(String name, String photoUri)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlacePhotoResponse() when $default != null:
        return $default(_that.name, _that.photoUri);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PlacePhotoResponse implements PlacePhotoResponse {
  const _PlacePhotoResponse({required this.name, required this.photoUri});
  factory _PlacePhotoResponse.fromJson(Map<String, dynamic> json) =>
      _$PlacePhotoResponseFromJson(json);

  @override
  final String name;
  @override
  final String photoUri;

  /// Create a copy of PlacePhotoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlacePhotoResponseCopyWith<_PlacePhotoResponse> get copyWith =>
      __$PlacePhotoResponseCopyWithImpl<_PlacePhotoResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlacePhotoResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlacePhotoResponse &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.photoUri, photoUri) ||
                other.photoUri == photoUri));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, photoUri);

  @override
  String toString() {
    return 'PlacePhotoResponse(name: $name, photoUri: $photoUri)';
  }
}

/// @nodoc
abstract mixin class _$PlacePhotoResponseCopyWith<$Res>
    implements $PlacePhotoResponseCopyWith<$Res> {
  factory _$PlacePhotoResponseCopyWith(
          _PlacePhotoResponse value, $Res Function(_PlacePhotoResponse) _then) =
      __$PlacePhotoResponseCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String photoUri});
}

/// @nodoc
class __$PlacePhotoResponseCopyWithImpl<$Res>
    implements _$PlacePhotoResponseCopyWith<$Res> {
  __$PlacePhotoResponseCopyWithImpl(this._self, this._then);

  final _PlacePhotoResponse _self;
  final $Res Function(_PlacePhotoResponse) _then;

  /// Create a copy of PlacePhotoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? photoUri = null,
  }) {
    return _then(_PlacePhotoResponse(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUri: null == photoUri
          ? _self.photoUri
          : photoUri // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
