import 'package:ramen_recommendation/api/google_places_api_client.dart';
import 'package:ramen_recommendation/api/requests/get_place_details_request.dart';
import 'package:ramen_recommendation/api/responses/get_place_details_response.dart';
import 'package:ramen_recommendation/api/responses/search_ramen_places_response.dart';
import 'package:ramen_recommendation/repositories/interfaces/places_repository_interface.dart';
import '../../api/requests/search_ramen_places_request.dart';


class PlacesRepository implements PlacesRepositoryInterface {
  final GooglePlacesApiClient apiClient;

  PlacesRepository(this.apiClient);

  /// ラーメン店を検索する
  @override
  Future<SearchRamenPlacesResponse> searchRamenPlaces({
    required SearchRamenPlacesRequest request,
  }) async {
    try {
      final response = await apiClient.post(
        'places:searchText',
        request.toRequestBody(),
      );
      return SearchRamenPlacesResponse.fromJson(response);
    } catch (e) {
      throw Exception('Failed to search ramen places: $e');
    }
  }

  /// ラーメン店の詳細情報を取得する
  @override
  Future<GetPlaceDetailsResponse> getPlaceDetails({
    required GetPlaceDetailsRequest request,
  }) async {
    try {
      final response = await apiClient.get(
        'places/${request.placeId}',
        request.toQueryParams(),
      );
      return GetPlaceDetailsResponse.fromJson(response);
    } catch (e) {
      throw Exception('Failed to fetch place details: $e');
    }
  }
}
