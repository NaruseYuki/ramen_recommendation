import 'package:geolocator/geolocator.dart';
import 'package:ramen_recommendation/api/providers/service_providers.dart';
import 'package:ramen_recommendation/models/ramen_state.dart';
import 'package:ramen_recommendation/repositories/interfaces/places_repository_interface.dart';
import 'package:ramen_recommendation/api/requests/search_ramen_places_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../errors/app_error_code.dart';

part 'search_results_viewmodel.g.dart';

@riverpod
class SearchResultsViewModel extends _$SearchResultsViewModel {
  late final PlacesRepositoryInterface _placesRepository;
  @override
  RamenState build() {
    _placesRepository = ref.watch(placeDetailsRepositoryProvider);
    return RamenState();
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
          latitude: position.latitude,
          longitude: position.longitude,
          keyword: keyword,
        ),
      );
      state = state.copyWith(places: response.places, isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
          error: AppErrorCode.commonInvalidParameter(), isLoading: false);
      return false;
    }
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
}
