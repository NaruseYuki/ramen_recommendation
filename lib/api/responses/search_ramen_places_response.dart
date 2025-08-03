import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ramen_recommendation/models/ramen_place.dart';

part 'search_ramen_places_response.freezed.dart';
part 'search_ramen_places_response.g.dart';

@freezed
abstract class SearchRamenPlacesResponse with _$SearchRamenPlacesResponse {
  const factory SearchRamenPlacesResponse({
    required List<RamenPlace> places,
  }) = _SearchRamenPlacesResponse;

  factory SearchRamenPlacesResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchRamenPlacesResponseFromJson(json);
}
