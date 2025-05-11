import 'package:ramen_recommendation/models/ramen_place.dart';

class SearchRamenPlacesResponse {
  final List<RamenPlace> places;

  SearchRamenPlacesResponse({required this.places});

  /// JSON から `SearchRamenPlacesResponse` を生成
  factory SearchRamenPlacesResponse.fromJson(Map<String, dynamic> json) {
    final placesJson = json['places'] as List<dynamic>? ?? [];
    final places =
        placesJson.map((place) => RamenPlace.fromJson(place)).toList();
    return SearchRamenPlacesResponse(places: places);
  }
}
