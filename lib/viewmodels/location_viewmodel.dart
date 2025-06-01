import 'package:geolocator/geolocator.dart';
import 'package:ramen_recommendation/api/requests/get_place_details_request.dart';
import 'package:ramen_recommendation/api/requests/search_ramen_places_request.dart';
import 'package:ramen_recommendation/api/responses/get_place_details_response.dart';
import 'package:ramen_recommendation/state/ramen_state.dart';
import 'package:ramen_recommendation/repositories/interfaces/places_repository_interface.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../errors/app_error_code.dart';

part 'location_viewmodel.g.dart';

@riverpod
class LocationViewModel extends _$LocationViewModel {
  late final PlacesRepositoryInterface _placesRepository;

  @override
  RamenState build(PlacesRepositoryInterface placesRepository) {
    _placesRepository = placesRepository;
    return RamenState();
  }

  /// 現在地を取得する
  Future<Position?> getCurrentLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('位置情報サービスが無効です。設定から有効にしてください。');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('位置情報の権限が拒否されました。');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('位置情報の権限が永久に拒否されています。設定から権限を許可してください。');
    }

    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    );
  }

  /// ラーメン店を検索
  Future<bool> searchRamenPlaces(String keyword) async {
    state = state.copyWith(isLoading: true);

    try {
      final position = await getCurrentLocation();
      if (position == null) {
        state = state.copyWith(
            error: AppErrorCode.mapPermissionDenied(), isLoading: false);
        return false;
      }

      final response = await _placesRepository.searchRamenPlaces(
        request: SearchRamenPlacesRequest(
          position: position,
          keyword: keyword,
        ),
      );
      state = state.copyWith(places: response.places, isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
          error: AppErrorCode.mapUnknownError(), isLoading: false);
      return false;
    }
  }

  /// Place Details API を呼び出す
  Future<GetPlaceDetailsResponse?> fetchPlaceDetails(String placeId) async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await _placesRepository.getPlaceDetails(
        request: GetPlaceDetailsRequest(placeId: placeId),
      );
      state = state.copyWith(isLoading: false);
      return response;
    } catch (e) {
      // 必要に応じてエラーハンドリングを追加
      state = state.copyWith(
          error: AppErrorCode.mapUnknownError(), isLoading: false);

      return null;
    }
  }
}
