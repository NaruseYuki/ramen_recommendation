// lib/repositories/implements/places_repository.dart
import 'package:dio/dio.dart';
import 'package:ramen_recommendation/api/requests/get_place_details_request.dart';
import 'package:ramen_recommendation/api/responses/get_place_details_with_images_response.dart';
import 'package:ramen_recommendation/api/responses/place_photo_response.dart';
import 'package:ramen_recommendation/api/responses/search_ramen_places_response.dart';
import 'package:ramen_recommendation/repositories/interfaces/places_repository_interface.dart';

import '../../api/google_places_api_client.dart';
import '../../api/requests/place_photo_request.dart';
import '../../api/requests/search_ramen_places_request.dart';
import '../../errors/app_error_code.dart';
import '../../utils/util.dart';
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

  @override
  Future<Result<SearchRamenPlacesResponse, AppErrorCode>> searchRamenPlaces({
    required SearchRamenPlacesRequest request,
  }) async {
    try {
      final apiKey = await getAPIKey();
      final fieldMask =
          'places.displayName,places.formattedAddress,places.location,places.id,places.photos';
      final response = await apiClient.searchRamenPlaces(
        request.toRequestBody(),
        apiKey,
        fieldMask,
        _contentType,
      );

      final updatedPlaces = await Future.wait(
        response.places.map((place) async {
          final PlacePhotoResponse placePhotoResponse;

          final firstPhotoName = place.photos?.isNotEmpty == true
              ? place.photos?.first.name
              : null;

          if (firstPhotoName != null && firstPhotoName.isNotEmpty) {
            final photoResult = await getPlacePhotos(
              request: PlacePhotoRequest(
                maxHeightPx: 400,
                maxWidthPx: 400,
              ),
              photoName: firstPhotoName,
            );

            if (photoResult is Success<PlacePhotoResponse, AppErrorCode>) {
              placePhotoResponse = photoResult.value;
              return place.copyWith(image: placePhotoResponse);
            }
          }

          return place.copyWith(image: null);
        }),
      );

      final updatedResponse = response.copyWith(places: updatedPlaces);

      return Success(updatedResponse);
    } on DioException catch (e) {
      return _handleDioException<SearchRamenPlacesResponse>(e);
    } on Exception catch (_) {
      return Failure(AppErrorCode.commonSystemError());
    }
  }

  @override
  Future<Result<GetPlaceDetailsWithImagesResponse, AppErrorCode>>
      getPlaceDetails({
    required GetPlaceDetailsRequest request,
  }) async {
    try {
      final apiKey = await getAPIKey();
      final response = await apiClient.getPlaceDetails(
          request.placeId, request.toQueryParams(), apiKey, _contentType);

      final photos = response.photos;
      final updatedPhotos = await Future.wait<PlacePhotoResponse?>(
        (photos != null && photos.isNotEmpty)
            ? photos.map((photo) async {
                final photoResult = await getPlacePhotos(
                  request: PlacePhotoRequest(
                    maxHeightPx: 400,
                    maxWidthPx: 400,
                  ),
                  photoName: photo.name,
                );
                if (photoResult is Success<PlacePhotoResponse, AppErrorCode>) {
                  return photoResult.value;
                } else {
                  return null;
                }
              }).toList()
            : [],
      );
      final updatedResponse = GetPlaceDetailsWithImagesResponse(
          placeDetails: response, images: updatedPhotos);

      return Success(updatedResponse);
    } on DioException catch (e) {
      return _handleDioException<GetPlaceDetailsWithImagesResponse>(e);
    } on Exception catch (e) {
      return Failure(AppErrorCode.commonSystemError());
    }
  }

  @override
  Future<Result<PlacePhotoResponse, AppErrorCode>> getPlacePhotos(
      {required PlacePhotoRequest request, required String photoName}) async {
    try {
      final apiKey = await getAPIKey();
      final response = await apiClient.getPlacePhotos(
        photoName,
        apiKey,
        request,
        _contentType,
      );
      return Success(response);
    } on DioException catch (e) {
      // ヘルパーメソッドを呼び出してエラーを処理
      return _handleDioException<PlacePhotoResponse>(e);
    } on Exception catch (e) {
      // その他の予期せぬエラー
      return Failure(AppErrorCode.commonSystemError());
    }
  }
}
