// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_place_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetPlaceDetailsResponse _$GetPlaceDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    _GetPlaceDetailsResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      userRatingsTotal: (json['userRatingsTotal'] as num?)?.toInt(),
      website: json['website'] as String?,
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      weekdayDescriptions: (json['weekdayDescriptions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      openNow: json['openNow'] as bool,
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetPlaceDetailsResponseToJson(
        _GetPlaceDetailsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'rating': instance.rating,
      'userRatingsTotal': instance.userRatingsTotal,
      'website': instance.website,
      'reviews': instance.reviews,
      'weekdayDescriptions': instance.weekdayDescriptions,
      'openNow': instance.openNow,
      'photos': instance.photos,
    };
