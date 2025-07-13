// lib/viewmodels/search_results_viewmodel.dart
import 'package:geolocator/geolocator.dart';
import 'package:ramen_recommendation/api/providers/service_providers.dart';
import 'package:ramen_recommendation/models/ramen_state.dart';
import 'package:ramen_recommendation/repositories/interfaces/places_repository_interface.dart';
import 'package:ramen_recommendation/api/requests/search_ramen_places_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../api/responses/search_ramen_places_response.dart';
import '../errors/app_error_code.dart';
import '../repositories/result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // StateControllerをインポートするために必要

part 'search_results_viewmodel.g.dart';

@riverpod
class SearchResultsViewModel extends _$SearchResultsViewModel {
  late final PlacesRepositoryInterface _placesRepository;
  late final StateController<AppErrorCode?> _errorMessageController; 

  @override
  RamenState build() {
    _placesRepository = ref.watch(placeDetailsRepositoryProvider);
    _errorMessageController = ref.read(errorMessageProvider.notifier); 
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
      _errorMessageController.state = AppErrorCode.mapUnknownError(); // 仮にマップ関連の不明なエラーとする
      state = state.copyWith(isLoading: false);
      return false;
    }


    if (position == null) {
      // state = state.copyWith(error: AppErrorCode.mapPermissionDenied(), isLoading: false); // RamenStateからerrorフィールドは削除されている
      _errorMessageController.state = AppErrorCode.mapPermissionDenied(); 
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
      // state = state.copyWith(error: result.exception, isLoading: false); // RamenStateからerrorフィールドは削除されている
      _errorMessageController.state = result.exception; 
      state = state.copyWith(isLoading: false);
      return false;
    } else {
      _errorMessageController.state = AppErrorCode.commonSystemError(); 
      state = state.copyWith(isLoading: false);
      return false;
    }
  }

  /// 現在地を取得する
  Future<Position?> getCurrentLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _errorMessageController.state = AppErrorCode.mapConnectionFailed(); // サービス無効をエラーとして扱う
      return null; // エラーメッセージを設定し、nullを返す
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _errorMessageController.state = AppErrorCode.mapPermissionDenied(); // 権限拒否をエラーとして扱う
        return null; // エラーメッセージを設定し、nullを返す
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _errorMessageController.state = AppErrorCode.mapPermissionDenied(); // 永久拒否をエラーとして扱う
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