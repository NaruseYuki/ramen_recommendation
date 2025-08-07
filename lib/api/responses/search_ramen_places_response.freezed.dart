// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_ramen_places_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchRamenPlacesResponse {
  List<RamenPlace> get places;

  /// Create a copy of SearchRamenPlacesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchRamenPlacesResponseCopyWith<SearchRamenPlacesResponse> get copyWith =>
      _$SearchRamenPlacesResponseCopyWithImpl<SearchRamenPlacesResponse>(
          this as SearchRamenPlacesResponse, _$identity);

  /// Serializes this SearchRamenPlacesResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchRamenPlacesResponse &&
            const DeepCollectionEquality().equals(other.places, places));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(places));

  @override
  String toString() {
    return 'SearchRamenPlacesResponse(places: $places)';
  }
}

/// @nodoc
abstract mixin class $SearchRamenPlacesResponseCopyWith<$Res> {
  factory $SearchRamenPlacesResponseCopyWith(SearchRamenPlacesResponse value,
          $Res Function(SearchRamenPlacesResponse) _then) =
      _$SearchRamenPlacesResponseCopyWithImpl;
  @useResult
  $Res call({List<RamenPlace> places});
}

/// @nodoc
class _$SearchRamenPlacesResponseCopyWithImpl<$Res>
    implements $SearchRamenPlacesResponseCopyWith<$Res> {
  _$SearchRamenPlacesResponseCopyWithImpl(this._self, this._then);

  final SearchRamenPlacesResponse _self;
  final $Res Function(SearchRamenPlacesResponse) _then;

  /// Create a copy of SearchRamenPlacesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? places = null,
  }) {
    return _then(_self.copyWith(
      places: null == places
          ? _self.places
          : places // ignore: cast_nullable_to_non_nullable
              as List<RamenPlace>,
    ));
  }
}

/// Adds pattern-matching-related methods to [SearchRamenPlacesResponse].
extension SearchRamenPlacesResponsePatterns on SearchRamenPlacesResponse {
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
    TResult Function(_SearchRamenPlacesResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchRamenPlacesResponse() when $default != null:
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
    TResult Function(_SearchRamenPlacesResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchRamenPlacesResponse():
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
    TResult? Function(_SearchRamenPlacesResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchRamenPlacesResponse() when $default != null:
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
    TResult Function(List<RamenPlace> places)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchRamenPlacesResponse() when $default != null:
        return $default(_that.places);
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
    TResult Function(List<RamenPlace> places) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchRamenPlacesResponse():
        return $default(_that.places);
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
    TResult? Function(List<RamenPlace> places)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchRamenPlacesResponse() when $default != null:
        return $default(_that.places);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SearchRamenPlacesResponse implements SearchRamenPlacesResponse {
  const _SearchRamenPlacesResponse({required final List<RamenPlace> places})
      : _places = places;
  factory _SearchRamenPlacesResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchRamenPlacesResponseFromJson(json);

  final List<RamenPlace> _places;
  @override
  List<RamenPlace> get places {
    if (_places is EqualUnmodifiableListView) return _places;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_places);
  }

  /// Create a copy of SearchRamenPlacesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchRamenPlacesResponseCopyWith<_SearchRamenPlacesResponse>
      get copyWith =>
          __$SearchRamenPlacesResponseCopyWithImpl<_SearchRamenPlacesResponse>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SearchRamenPlacesResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchRamenPlacesResponse &&
            const DeepCollectionEquality().equals(other._places, _places));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_places));

  @override
  String toString() {
    return 'SearchRamenPlacesResponse(places: $places)';
  }
}

/// @nodoc
abstract mixin class _$SearchRamenPlacesResponseCopyWith<$Res>
    implements $SearchRamenPlacesResponseCopyWith<$Res> {
  factory _$SearchRamenPlacesResponseCopyWith(_SearchRamenPlacesResponse value,
          $Res Function(_SearchRamenPlacesResponse) _then) =
      __$SearchRamenPlacesResponseCopyWithImpl;
  @override
  @useResult
  $Res call({List<RamenPlace> places});
}

/// @nodoc
class __$SearchRamenPlacesResponseCopyWithImpl<$Res>
    implements _$SearchRamenPlacesResponseCopyWith<$Res> {
  __$SearchRamenPlacesResponseCopyWithImpl(this._self, this._then);

  final _SearchRamenPlacesResponse _self;
  final $Res Function(_SearchRamenPlacesResponse) _then;

  /// Create a copy of SearchRamenPlacesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? places = null,
  }) {
    return _then(_SearchRamenPlacesResponse(
      places: null == places
          ? _self._places
          : places // ignore: cast_nullable_to_non_nullable
              as List<RamenPlace>,
    ));
  }
}

// dart format on
