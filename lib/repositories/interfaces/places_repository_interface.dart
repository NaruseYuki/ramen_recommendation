import 'package:ramen_recommendation/models/requests/get_place_details_request.dart';
import 'package:ramen_recommendation/models/requests/search_ramen_places_request.dart';

abstract class PlacesRepositoryInterface {
  Future<List<Map<String, dynamic>>> searchRamenPlaces({
    required SearchRamenPlacesRequest request,
  });

  Future<Map<String, dynamic>> getPlaceDetails({
    required GetPlaceDetailsRequest request,
  });
}
