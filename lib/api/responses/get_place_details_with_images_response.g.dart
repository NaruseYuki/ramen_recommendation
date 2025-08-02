// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_place_details_with_images_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetPlaceDetailsWithImagesResponse _$GetPlaceDetailsWithImagesResponseFromJson(
        Map<String, dynamic> json) =>
    _GetPlaceDetailsWithImagesResponse(
      placeDetails: GetPlaceDetailsResponse.fromJson(
          json['placeDetails'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>)
          .map((e) => e == null
              ? null
              : PlacePhotoResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetPlaceDetailsWithImagesResponseToJson(
        _GetPlaceDetailsWithImagesResponse instance) =>
    <String, dynamic>{
      'placeDetails': instance.placeDetails,
      'images': instance.images,
    };
