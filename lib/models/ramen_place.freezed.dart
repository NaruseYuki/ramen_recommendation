// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
// const factory を使用するのが一般的
  String get id;
  String get name;
  String get address;
  double get latitude;
  double get longitude;

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
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, address, latitude, longitude);

  @override
  String toString() {
    return 'RamenPlace(id: $id, name: $name, address: $address, latitude: $latitude, longitude: $longitude)';
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
      String name,
      String address,
      double latitude,
      double longitude});
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
    Object? name = null,
    Object? address = null,
    Object? latitude = null,
    Object? longitude = null,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _RamenPlace implements RamenPlace {
  const _RamenPlace(
      {required this.id,
      required this.name,
      required this.address,
      required this.latitude,
      required this.longitude});
  factory _RamenPlace.fromJson(Map<String, dynamic> json) =>
      _$RamenPlaceFromJson(json);

// const factory を使用するのが一般的
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
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, address, latitude, longitude);

  @override
  String toString() {
    return 'RamenPlace(id: $id, name: $name, address: $address, latitude: $latitude, longitude: $longitude)';
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
      String name,
      String address,
      double latitude,
      double longitude});
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
    Object? name = null,
    Object? address = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_RamenPlace(
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
    ));
  }
}

// dart format on
