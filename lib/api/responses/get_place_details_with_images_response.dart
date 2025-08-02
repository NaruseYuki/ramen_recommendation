import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ramen_recommendation/api/responses/place_photo_response.dart';

import 'get_place_details_response.dart';

part 'get_place_details_with_images_response.freezed.dart';
part 'get_place_details_with_images_response.g.dart';

@freezed
abstract class GetPlaceDetailsWithImagesResponse
    with _$GetPlaceDetailsWithImagesResponse {
  const factory GetPlaceDetailsWithImagesResponse({
    required GetPlaceDetailsResponse placeDetails,
    required List<PlacePhotoResponse?> images,
  }) = _GetPlaceDetailsWithImagesResponse;

  factory GetPlaceDetailsWithImagesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetPlaceDetailsWithImagesResponseFromJson(json);
}
