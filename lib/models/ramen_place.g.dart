// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ramen_place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RamenPlace _$RamenPlaceFromJson(Map<String, dynamic> json) => _RamenPlace(
      id: json['id'] as String,
      displayName:
          DisplayName.fromJson(json['displayName'] as Map<String, dynamic>),
      address: json['formattedAddress'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RamenPlaceToJson(_RamenPlace instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'formattedAddress': instance.address,
      'location': instance.location,
    };

_DisplayName _$DisplayNameFromJson(Map<String, dynamic> json) => _DisplayName(
      text: json['text'] as String,
    );

Map<String, dynamic> _$DisplayNameToJson(_DisplayName instance) =>
    <String, dynamic>{
      'text': instance.text,
    };

_Location _$LocationFromJson(Map<String, dynamic> json) => _Location(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$LocationToJson(_Location instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
