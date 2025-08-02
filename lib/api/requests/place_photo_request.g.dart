// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_photo_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlacePhotoRequest _$PlacePhotoRequestFromJson(Map<String, dynamic> json) =>
    _PlacePhotoRequest(
      maxHeightPx: (json['maxHeightPx'] as num?)?.toInt() ?? null,
      maxWidthPx: (json['maxWidthPx'] as num?)?.toInt() ?? null,
      skipHttpRedirect: json['skipHttpRedirect'] as bool? ?? true,
    );

Map<String, dynamic> _$PlacePhotoRequestToJson(_PlacePhotoRequest instance) =>
    <String, dynamic>{
      'maxHeightPx': instance.maxHeightPx,
      'maxWidthPx': instance.maxWidthPx,
      'skipHttpRedirect': instance.skipHttpRedirect,
    };
