// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_ramen_places_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchRamenPlacesRequest _$SearchRamenPlacesRequestFromJson(
        Map<String, dynamic> json) =>
    _SearchRamenPlacesRequest(
      keyword: json['keyword'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      pageSize: (json['pageSize'] as num?)?.toInt() ?? 10,
      languageCode: json['languageCode'] as String? ?? 'ja',
      radius: (json['radius'] as num?)?.toDouble() ?? 500.0,
    );
