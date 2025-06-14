// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ramen_place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RamenPlace _$RamenPlaceFromJson(Map<String, dynamic> json) => _RamenPlace(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$RamenPlaceToJson(_RamenPlace instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
