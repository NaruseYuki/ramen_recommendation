// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_ramen_places_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchRamenPlacesResponse _$SearchRamenPlacesResponseFromJson(
        Map<String, dynamic> json) =>
    _SearchRamenPlacesResponse(
      places: (json['places'] as List<dynamic>)
          .map((e) => RamenPlace.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchRamenPlacesResponseToJson(
        _SearchRamenPlacesResponse instance) =>
    <String, dynamic>{
      'places': instance.places,
    };
