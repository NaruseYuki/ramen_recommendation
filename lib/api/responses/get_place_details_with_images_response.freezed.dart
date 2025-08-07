// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_place_details_with_images_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetPlaceDetailsWithImagesResponse {
  GetPlaceDetailsResponse get placeDetails;
  List<PlacePhotoResponse?> get images;

  /// Create a copy of GetPlaceDetailsWithImagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetPlaceDetailsWithImagesResponseCopyWith<GetPlaceDetailsWithImagesResponse>
      get copyWith => _$GetPlaceDetailsWithImagesResponseCopyWithImpl<
              GetPlaceDetailsWithImagesResponse>(
          this as GetPlaceDetailsWithImagesResponse, _$identity);

  /// Serializes this GetPlaceDetailsWithImagesResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetPlaceDetailsWithImagesResponse &&
            (identical(other.placeDetails, placeDetails) ||
                other.placeDetails == placeDetails) &&
            const DeepCollectionEquality().equals(other.images, images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, placeDetails, const DeepCollectionEquality().hash(images));

  @override
  String toString() {
    return 'GetPlaceDetailsWithImagesResponse(placeDetails: $placeDetails, images: $images)';
  }
}

/// @nodoc
abstract mixin class $GetPlaceDetailsWithImagesResponseCopyWith<$Res> {
  factory $GetPlaceDetailsWithImagesResponseCopyWith(
          GetPlaceDetailsWithImagesResponse value,
          $Res Function(GetPlaceDetailsWithImagesResponse) _then) =
      _$GetPlaceDetailsWithImagesResponseCopyWithImpl;
  @useResult
  $Res call(
      {GetPlaceDetailsResponse placeDetails, List<PlacePhotoResponse?> images});

  $GetPlaceDetailsResponseCopyWith<$Res> get placeDetails;
}

/// @nodoc
class _$GetPlaceDetailsWithImagesResponseCopyWithImpl<$Res>
    implements $GetPlaceDetailsWithImagesResponseCopyWith<$Res> {
  _$GetPlaceDetailsWithImagesResponseCopyWithImpl(this._self, this._then);

  final GetPlaceDetailsWithImagesResponse _self;
  final $Res Function(GetPlaceDetailsWithImagesResponse) _then;

  /// Create a copy of GetPlaceDetailsWithImagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeDetails = null,
    Object? images = null,
  }) {
    return _then(_self.copyWith(
      placeDetails: null == placeDetails
          ? _self.placeDetails
          : placeDetails // ignore: cast_nullable_to_non_nullable
              as GetPlaceDetailsResponse,
      images: null == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<PlacePhotoResponse?>,
    ));
  }

  /// Create a copy of GetPlaceDetailsWithImagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GetPlaceDetailsResponseCopyWith<$Res> get placeDetails {
    return $GetPlaceDetailsResponseCopyWith<$Res>(_self.placeDetails, (value) {
      return _then(_self.copyWith(placeDetails: value));
    });
  }
}

/// Adds pattern-matching-related methods to [GetPlaceDetailsWithImagesResponse].
extension GetPlaceDetailsWithImagesResponsePatterns
    on GetPlaceDetailsWithImagesResponse {
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
    TResult Function(_GetPlaceDetailsWithImagesResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GetPlaceDetailsWithImagesResponse() when $default != null:
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
    TResult Function(_GetPlaceDetailsWithImagesResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GetPlaceDetailsWithImagesResponse():
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
    TResult? Function(_GetPlaceDetailsWithImagesResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GetPlaceDetailsWithImagesResponse() when $default != null:
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
    TResult Function(GetPlaceDetailsResponse placeDetails,
            List<PlacePhotoResponse?> images)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GetPlaceDetailsWithImagesResponse() when $default != null:
        return $default(_that.placeDetails, _that.images);
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
    TResult Function(GetPlaceDetailsResponse placeDetails,
            List<PlacePhotoResponse?> images)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GetPlaceDetailsWithImagesResponse():
        return $default(_that.placeDetails, _that.images);
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
    TResult? Function(GetPlaceDetailsResponse placeDetails,
            List<PlacePhotoResponse?> images)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GetPlaceDetailsWithImagesResponse() when $default != null:
        return $default(_that.placeDetails, _that.images);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GetPlaceDetailsWithImagesResponse
    implements GetPlaceDetailsWithImagesResponse {
  const _GetPlaceDetailsWithImagesResponse(
      {required this.placeDetails,
      required final List<PlacePhotoResponse?> images})
      : _images = images;
  factory _GetPlaceDetailsWithImagesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetPlaceDetailsWithImagesResponseFromJson(json);

  @override
  final GetPlaceDetailsResponse placeDetails;
  final List<PlacePhotoResponse?> _images;
  @override
  List<PlacePhotoResponse?> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  /// Create a copy of GetPlaceDetailsWithImagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GetPlaceDetailsWithImagesResponseCopyWith<
          _GetPlaceDetailsWithImagesResponse>
      get copyWith => __$GetPlaceDetailsWithImagesResponseCopyWithImpl<
          _GetPlaceDetailsWithImagesResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GetPlaceDetailsWithImagesResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetPlaceDetailsWithImagesResponse &&
            (identical(other.placeDetails, placeDetails) ||
                other.placeDetails == placeDetails) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, placeDetails, const DeepCollectionEquality().hash(_images));

  @override
  String toString() {
    return 'GetPlaceDetailsWithImagesResponse(placeDetails: $placeDetails, images: $images)';
  }
}

/// @nodoc
abstract mixin class _$GetPlaceDetailsWithImagesResponseCopyWith<$Res>
    implements $GetPlaceDetailsWithImagesResponseCopyWith<$Res> {
  factory _$GetPlaceDetailsWithImagesResponseCopyWith(
          _GetPlaceDetailsWithImagesResponse value,
          $Res Function(_GetPlaceDetailsWithImagesResponse) _then) =
      __$GetPlaceDetailsWithImagesResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {GetPlaceDetailsResponse placeDetails, List<PlacePhotoResponse?> images});

  @override
  $GetPlaceDetailsResponseCopyWith<$Res> get placeDetails;
}

/// @nodoc
class __$GetPlaceDetailsWithImagesResponseCopyWithImpl<$Res>
    implements _$GetPlaceDetailsWithImagesResponseCopyWith<$Res> {
  __$GetPlaceDetailsWithImagesResponseCopyWithImpl(this._self, this._then);

  final _GetPlaceDetailsWithImagesResponse _self;
  final $Res Function(_GetPlaceDetailsWithImagesResponse) _then;

  /// Create a copy of GetPlaceDetailsWithImagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? placeDetails = null,
    Object? images = null,
  }) {
    return _then(_GetPlaceDetailsWithImagesResponse(
      placeDetails: null == placeDetails
          ? _self.placeDetails
          : placeDetails // ignore: cast_nullable_to_non_nullable
              as GetPlaceDetailsResponse,
      images: null == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<PlacePhotoResponse?>,
    ));
  }

  /// Create a copy of GetPlaceDetailsWithImagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GetPlaceDetailsResponseCopyWith<$Res> get placeDetails {
    return $GetPlaceDetailsResponseCopyWith<$Res>(_self.placeDetails, (value) {
      return _then(_self.copyWith(placeDetails: value));
    });
  }
}

// dart format on
