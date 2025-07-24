// lib/viewmodels/search_results_viewmodel.dart
import 'package:geolocator/geolocator.dart';
import 'package:ramen_recommendation/api/providers/service_providers.dart';
import 'package:ramen_recommendation/api/requests/search_ramen_places_request.dart';
import 'package:ramen_recommendation/models/ramen_state.dart';
import 'package:ramen_recommendation/repositories/interfaces/places_repository_interface.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../api/responses/search_ramen_places_response.dart';
import '../errors/app_error_code.dart';
import '../repositories/result.dart';

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
    Position? position;
    try {
      position = await getCurrentLocation();
    } catch (e) {
      // 例外メッセージを直接errorMessageProviderに渡す
      ref.read(errorMessageProvider.notifier).state =
          AppErrorCode.mapUnknownError(); // 仮にマップ関連の不明なエラーとする
      state = state.copyWith(isLoading: false);
      return false;
    }

    if (position == null) {
      ref.read(errorMessageProvider.notifier).state =
          AppErrorCode.mapPermissionDenied();
      state = state.copyWith(isLoading: false);
      return false;
    }
    final result = await _placesRepository.searchRamenPlaces(
      request: SearchRamenPlacesRequest(
        latitude: position.latitude,
        longitude: position.longitude,
        keyword: keyword,
      ),
    );

    if (result is Success<SearchRamenPlacesResponse, AppErrorCode>) {
      state = state.copyWith(places: result.value.places, isLoading: false);
      return true;
    } else if (result is Failure<SearchRamenPlacesResponse, AppErrorCode>) {
      ref.read(errorMessageProvider.notifier).state = result.exception;
      state = state.copyWith(isLoading: false);
      return false;
    } else {
      ref.read(errorMessageProvider.notifier).state =
          AppErrorCode.commonSystemError();
      state = state.copyWith(isLoading: false);
      return false;
    }
  }

  /// 現在地を取得する
  Future<Position?> getCurrentLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return null; // エラーメッセージを設定し、nullを返す
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null; // エラーメッセージを設定し、nullを返す
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ref.read(errorMessageProvider.notifier).state =
          AppErrorCode.mapPermissionDenied(); // 永久拒否をエラーとして扱う
      state = state.copyWith(isLoading: false);
      return null; // エラーメッセージを設定し、nullを返す
    }

    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    );
  }
}
