// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_photo_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlacePhotoRequest {
  int? get maxHeightPx;
  int? get maxWidthPx;
  bool get skipHttpRedirect;

  /// Create a copy of PlacePhotoRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlacePhotoRequestCopyWith<PlacePhotoRequest> get copyWith =>
      _$PlacePhotoRequestCopyWithImpl<PlacePhotoRequest>(
          this as PlacePhotoRequest, _$identity);

  /// Serializes this PlacePhotoRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlacePhotoRequest &&
            (identical(other.maxHeightPx, maxHeightPx) ||
                other.maxHeightPx == maxHeightPx) &&
            (identical(other.maxWidthPx, maxWidthPx) ||
                other.maxWidthPx == maxWidthPx) &&
            (identical(other.skipHttpRedirect, skipHttpRedirect) ||
                other.skipHttpRedirect == skipHttpRedirect));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, maxHeightPx, maxWidthPx, skipHttpRedirect);

  @override
  String toString() {
    return 'PlacePhotoRequest(maxHeightPx: $maxHeightPx, maxWidthPx: $maxWidthPx, skipHttpRedirect: $skipHttpRedirect)';
  }
}

/// @nodoc
abstract mixin class $PlacePhotoRequestCopyWith<$Res> {
  factory $PlacePhotoRequestCopyWith(
          PlacePhotoRequest value, $Res Function(PlacePhotoRequest) _then) =
      _$PlacePhotoRequestCopyWithImpl;
  @useResult
  $Res call({int? maxHeightPx, int? maxWidthPx, bool skipHttpRedirect});
}

/// @nodoc
class _$PlacePhotoRequestCopyWithImpl<$Res>
    implements $PlacePhotoRequestCopyWith<$Res> {
  _$PlacePhotoRequestCopyWithImpl(this._self, this._then);

  final PlacePhotoRequest _self;
  final $Res Function(PlacePhotoRequest) _then;

  /// Create a copy of PlacePhotoRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxHeightPx = freezed,
    Object? maxWidthPx = freezed,
    Object? skipHttpRedirect = null,
  }) {
    return _then(_self.copyWith(
      maxHeightPx: freezed == maxHeightPx
          ? _self.maxHeightPx
          : maxHeightPx // ignore: cast_nullable_to_non_nullable
              as int?,
      maxWidthPx: freezed == maxWidthPx
          ? _self.maxWidthPx
          : maxWidthPx // ignore: cast_nullable_to_non_nullable
              as int?,
      skipHttpRedirect: null == skipHttpRedirect
          ? _self.skipHttpRedirect
          : skipHttpRedirect // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [PlacePhotoRequest].
extension PlacePhotoRequestPatterns on PlacePhotoRequest {
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
    TResult Function(_PlacePhotoRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlacePhotoRequest() when $default != null:
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
    TResult Function(_PlacePhotoRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlacePhotoRequest():
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
    TResult? Function(_PlacePhotoRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlacePhotoRequest() when $default != null:
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
    TResult Function(int? maxHeightPx, int? maxWidthPx, bool skipHttpRedirect)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlacePhotoRequest() when $default != null:
        return $default(
            _that.maxHeightPx, _that.maxWidthPx, _that.skipHttpRedirect);
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
    TResult Function(int? maxHeightPx, int? maxWidthPx, bool skipHttpRedirect)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlacePhotoRequest():
        return $default(
            _that.maxHeightPx, _that.maxWidthPx, _that.skipHttpRedirect);
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
    TResult? Function(int? maxHeightPx, int? maxWidthPx, bool skipHttpRedirect)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlacePhotoRequest() when $default != null:
        return $default(
            _that.maxHeightPx, _that.maxWidthPx, _that.skipHttpRedirect);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PlacePhotoRequest implements PlacePhotoRequest {
  const _PlacePhotoRequest(
      {this.maxHeightPx = null,
      this.maxWidthPx = null,
      this.skipHttpRedirect = true});
  factory _PlacePhotoRequest.fromJson(Map<String, dynamic> json) =>
      _$PlacePhotoRequestFromJson(json);

  @override
  @JsonKey()
  final int? maxHeightPx;
  @override
  @JsonKey()
  final int? maxWidthPx;
  @override
  @JsonKey()
  final bool skipHttpRedirect;

  /// Create a copy of PlacePhotoRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlacePhotoRequestCopyWith<_PlacePhotoRequest> get copyWith =>
      __$PlacePhotoRequestCopyWithImpl<_PlacePhotoRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlacePhotoRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlacePhotoRequest &&
            (identical(other.maxHeightPx, maxHeightPx) ||
                other.maxHeightPx == maxHeightPx) &&
            (identical(other.maxWidthPx, maxWidthPx) ||
                other.maxWidthPx == maxWidthPx) &&
            (identical(other.skipHttpRedirect, skipHttpRedirect) ||
                other.skipHttpRedirect == skipHttpRedirect));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, maxHeightPx, maxWidthPx, skipHttpRedirect);

  @override
  String toString() {
    return 'PlacePhotoRequest(maxHeightPx: $maxHeightPx, maxWidthPx: $maxWidthPx, skipHttpRedirect: $skipHttpRedirect)';
  }
}

/// @nodoc
abstract mixin class _$PlacePhotoRequestCopyWith<$Res>
    implements $PlacePhotoRequestCopyWith<$Res> {
  factory _$PlacePhotoRequestCopyWith(
          _PlacePhotoRequest value, $Res Function(_PlacePhotoRequest) _then) =
      __$PlacePhotoRequestCopyWithImpl;
  @override
  @useResult
  $Res call({int? maxHeightPx, int? maxWidthPx, bool skipHttpRedirect});
}

/// @nodoc
class __$PlacePhotoRequestCopyWithImpl<$Res>
    implements _$PlacePhotoRequestCopyWith<$Res> {
  __$PlacePhotoRequestCopyWithImpl(this._self, this._then);

  final _PlacePhotoRequest _self;
  final $Res Function(_PlacePhotoRequest) _then;

  /// Create a copy of PlacePhotoRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? maxHeightPx = freezed,
    Object? maxWidthPx = freezed,
    Object? skipHttpRedirect = null,
  }) {
    return _then(_PlacePhotoRequest(
      maxHeightPx: freezed == maxHeightPx
          ? _self.maxHeightPx
          : maxHeightPx // ignore: cast_nullable_to_non_nullable
              as int?,
      maxWidthPx: freezed == maxWidthPx
          ? _self.maxWidthPx
          : maxWidthPx // ignore: cast_nullable_to_non_nullable
              as int?,
      skipHttpRedirect: null == skipHttpRedirect
          ? _self.skipHttpRedirect
          : skipHttpRedirect // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
