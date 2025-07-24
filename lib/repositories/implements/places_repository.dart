// lib/repositories/implements/places_repository.dart
import 'package:dio/dio.dart';
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

  /// DioExceptionを処理し、適切なResult<T, AppErrorCode>を返すヘルパーメソッド
  Result<T, AppErrorCode> _handleDioException<T>(DioException e) {
    if (e.response?.data is Failure<dynamic, AppErrorCode>) {
      // CustomInterceptorがresolveしたFailureオブジェクトが検出された場合、それをそのまま返す
      return e.response?.data as Failure<T, AppErrorCode>;
    }
    // その他のDioExceptionは一般的なネットワークエラーとする
    return Failure(AppErrorCode.commonNetworkError());
  }

  /// ラーメン店を検索する
  @override
  Future<Result<SearchRamenPlacesResponse, AppErrorCode>> searchRamenPlaces({
    required SearchRamenPlacesRequest request,
  }) async {
    try {
      final apiKey = await getAPIKey();
      final fieldMask =
          'places.displayName,places.formattedAddress,places.location,places.id,places.photos';
      final response = await apiClient.searchRamenPlaces(
          request.toRequestBody(), apiKey, fieldMask, _contentType);
      return Success(response);
    } on DioException catch (e) {
      // ヘルパーメソッドを呼び出してエラーを処理
      return _handleDioException<SearchRamenPlacesResponse>(e);
    } on Exception catch (e) {
      // その他の予期せぬエラー
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
      final response = await apiClient.getPlaceDetails(
          request.placeId, request.toQueryParams(), apiKey, _contentType);
      return Success(response);
    } on DioException catch (e) {
      // ヘルパーメソッドを呼び出してエラーを処理
      return _handleDioException<GetPlaceDetailsResponse>(e);
    } on Exception catch (e) {
      // その他の予期せぬエラー
      return Failure(AppErrorCode.commonSystemError());
    }
  }
}
