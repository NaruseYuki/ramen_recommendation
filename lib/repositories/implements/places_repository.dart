import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:ramen_recommendation/api/requests/get_place_details_request.dart';
import 'package:ramen_recommendation/api/responses/get_place_details_response.dart';
import 'package:ramen_recommendation/api/responses/search_ramen_places_response.dart';
import 'package:ramen_recommendation/repositories/interfaces/places_repository_interface.dart';
import '../../api/google_places_api_client.dart';
import '../../api/requests/search_ramen_places_request.dart';

class PlacesRepository implements PlacesRepositoryInterface {
  final GooglePlacesApiClient apiClient;
  final String _contentType = 'application/json';

  PlacesRepository(this.apiClient);

  /// ラーメン店を検索する
  @override
  Future<SearchRamenPlacesResponse> searchRamenPlaces({
    required SearchRamenPlacesRequest request,
  }) async {
    try {
      final apiKey = await getAPIKey();
      final fieldMask =
          'places.displayName,places.formattedAddress,places.location,places.id';
      return await apiClient.searchRamenPlaces(request.toRequestBody(), apiKey, fieldMask, _contentType);
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
      final apiKey = await getAPIKey();
      return await apiClient.getPlaceDetails(request.placeId, request.toQueryParams(), apiKey, _contentType);
    } catch (e) {
      throw Exception('Failed to fetch place details: $e');
    }
  }
}

/// 環境変数から API キーを読み込む
Future<String> getAPIKey() async {
  const flavor = String.fromEnvironment('FLAVOR', defaultValue: 'dev');
  final envFileName = '.env.$flavor';

  final envData = await rootBundle.loadString(envFileName);
  final label = envData.split('\n');
  return label
      .firstWhere((line) => line.startsWith('GOOGLE_MAPS_API_KEY'))
      .split(' ')[1]
      .trim();
}
