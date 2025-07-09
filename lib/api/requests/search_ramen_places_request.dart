import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_ramen_places_request.freezed.dart';
part 'search_ramen_places_request.g.dart';

@Freezed(toJson: false)
abstract class SearchRamenPlacesRequest with _$SearchRamenPlacesRequest {
  const factory SearchRamenPlacesRequest({
    required String keyword,
    required double latitude,
    required double longitude,
    @Default(10) int pageSize,
    @Default('ja') String languageCode,
    @Default(500.0) double radius,
  }) = _SearchRamenPlacesRequest;

  factory SearchRamenPlacesRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchRamenPlacesRequestFromJson(json);
}

extension SearchRamenPlacesRequestToJson on SearchRamenPlacesRequest {
  Map<String, dynamic> toRequestBody() {
    return {
      'textQuery': keyword,
      'pageSize': pageSize,
      'languageCode': languageCode,
      'locationBias': {
        'circle': {
          'center': {
            'latitude': latitude,
            'longitude': longitude,
          },
          'radius': radius,
        },
      },
    };
  }
}
