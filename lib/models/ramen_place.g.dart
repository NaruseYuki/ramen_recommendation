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
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
      image: json['image'] == null
          ? null
          : PlacePhotoResponse.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RamenPlaceToJson(_RamenPlace instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'formattedAddress': instance.address,
      'location': instance.location,
      'photos': instance.photos,
      'image': instance.image,
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

_Photo _$PhotoFromJson(Map<String, dynamic> json) => _Photo(
      name: json['name'] as String,
      widthPx: (json['widthPx'] as num).toInt(),
      heightPx: (json['heightPx'] as num).toInt(),
      authorAttributions: (json['authorAttributions'] as List<dynamic>?)
          ?.map((e) => AuthorAttribution.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PhotoToJson(_Photo instance) => <String, dynamic>{
      'name': instance.name,
      'widthPx': instance.widthPx,
      'heightPx': instance.heightPx,
      'authorAttributions': instance.authorAttributions,
    };

_AuthorAttribution _$AuthorAttributionFromJson(Map<String, dynamic> json) =>
    _AuthorAttribution(
      displayName: json['displayName'] as String,
      uri: json['uri'] as String?,
      photoUri: json['photoUri'] as String?,
    );

Map<String, dynamic> _$AuthorAttributionToJson(_AuthorAttribution instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'uri': instance.uri,
      'photoUri': instance.photoUri,
    };
