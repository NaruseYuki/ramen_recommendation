import 'package:ramen_recommendation/api/responses/get_place_details_response.dart';
import 'package:ramen_recommendation/api/responses/search_ramen_places_response.dart';

import '../../api/requests/get_place_details_request.dart';
import '../../api/requests/search_ramen_places_request.dart';

abstract class PlacesRepositoryInterface {
  Future<SearchRamenPlacesResponse> searchRamenPlaces({
    required SearchRamenPlacesRequest request,
  });

  Future<GetPlaceDetailsResponse> getPlaceDetails({
    required GetPlaceDetailsRequest request,
  });
}
