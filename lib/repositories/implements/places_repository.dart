import 'package:ramen_recommendation/api/google_places_api_client.dart';
import 'package:ramen_recommendation/models/requests/search_ramen_places_request.dart';
import 'package:ramen_recommendation/models/requests/get_place_details_request.dart';
import 'package:ramen_recommendation/repositories/interfaces/places_repository_interface.dart';

class PlacesRepository implements PlacesRepositoryInterface {
  final GooglePlacesApiClient apiClient;

  PlacesRepository(this.apiClient);

  /// ラーメン店を検索する
  @override
  Future<List<Map<String, dynamic>>> searchRamenPlaces({
    required SearchRamenPlacesRequest request,
  }) async {
    try {
      final response = await apiClient.post(
        'places:searchText',
        request.toRequestBody(),
      );
      final results = (response['places'] as List<dynamic>?) ?? [];
      return results.cast<Map<String, dynamic>>();
    } catch (e) {
      throw Exception('Failed to search ramen places: $e');
    }
  }

  /// ラーメン店の詳細情報を取得する
  @override
  Future<Map<String, dynamic>> getPlaceDetails({
    required GetPlaceDetailsRequest request,
  }) async {
    try {
      final response = await apiClient.get(
        'places/${request.placeId}',
        request.toQueryParams(),
      );
      return response;
    } catch (e) {
      throw Exception('Failed to fetch place details: $e');
    }
  }
}
