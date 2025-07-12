import 'package:ramen_recommendation/api/responses/get_place_details_response.dart';
import 'package:ramen_recommendation/api/responses/search_ramen_places_response.dart';

import '../../api/requests/get_place_details_request.dart';
import '../../api/requests/search_ramen_places_request.dart';
import '../../errors/app_error_code.dart';
import '../result.dart';

abstract class PlacesRepositoryInterface {
  Future<Result<SearchRamenPlacesResponse, AppErrorCode>> searchRamenPlaces({
    required SearchRamenPlacesRequest request,
  });

  Future<Result<GetPlaceDetailsResponse, AppErrorCode>> getPlaceDetails({
    required GetPlaceDetailsRequest request,
  });
}