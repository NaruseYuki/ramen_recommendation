import 'package:ramen_recommendation/api/requests/get_place_details_request.dart';
import 'package:ramen_recommendation/api/responses/get_place_details_response.dart';
import 'package:ramen_recommendation/api/responses/search_ramen_places_response.dart';
import 'package:ramen_recommendation/repositories/interfaces/places_repository_interface.dart';
import '../../api/google_places_api_client.dart';
import '../../api/requests/search_ramen_places_request.dart';
import '../../errors/app_error_code.dart';
import '../../utils/util.kt.dart';
import '../result.dart';

class PlacesRepository implements PlacesRepositoryInterface {
  final GooglePlacesApiClient apiClient;
  final String _contentType = 'application/json';

  PlacesRepository(this.apiClient);

  /// ラーメン店を検索する
  @override
  Future<Result<SearchRamenPlacesResponse, AppErrorCode>> searchRamenPlaces({
    required SearchRamenPlacesRequest request,
  }) async {
    try {
      final apiKey = await getAPIKey();
      final fieldMask =
          'places.displayName,places.formattedAddress,places.location,places.id';
      final response = await apiClient.searchRamenPlaces(request.toRequestBody(), apiKey, fieldMask, _contentType);
      return Success(response);
    } on Exception catch (e) {
      return Failure(AppErrorCode.commonSystemError());
    }
  }

  /// ラーメン店の詳細情報を取得する
  @override
  Future<Result<GetPlaceDetailsResponse, AppErrorCode>> getPlaceDetails({
    required GetPlaceDetailsRequest request,
  }) async {
    try {
      final apiKey = await getAPIKey();
      final response = await apiClient.getPlaceDetails(request.placeId, request.toQueryParams(), apiKey, _contentType);
      return Success(response);
    } on Exception catch (e) {
      return Failure(AppErrorCode.commonSystemError());
    }
  }
}
