// lib/viewmodels/search_results_viewmodel.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ramen_recommendation/api/providers/service_providers.dart';
import 'package:ramen_recommendation/api/requests/search_ramen_places_request.dart';
import 'package:ramen_recommendation/models/ramen_state.dart';
import 'package:ramen_recommendation/repositories/interfaces/places_repository_interface.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../api/responses/search_ramen_places_response.dart';
import '../errors/app_error_code.dart';
import '../models/ramen_place.dart';
import '../repositories/implements/database_repository.dart';
import '../repositories/result.dart';

part 'search_results_viewmodel.g.dart';

@riverpod
class SearchResultsViewModel extends _$SearchResultsViewModel {
  late final DatabaseService _databaseService;
  late final PlacesRepositoryInterface _placesRepository;
  late final StateController<AppErrorCode?> _errorMessageController;

  @override
  RamenState build() {
    _placesRepository = ref.watch(placeDetailsRepositoryProvider);
    _databaseService = ref.watch(databaseServiceProvider);
    _errorMessageController = ref.read(errorMessageProvider.notifier);
    return RamenState();
  }

  /// ラーメン店を検索
  Future<bool> searchRamenPlaces(
      {String keyword = 'ラーメン', double radius = 500}) async {
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
      _errorMessageController.state = AppErrorCode.mapPermissionDenied();
      state = state.copyWith(isLoading: false);
      return false;
    }
    final result = await _placesRepository.searchRamenPlaces(
      request: SearchRamenPlacesRequest(
          latitude: position.latitude,
          longitude: position.longitude,
          keyword: keyword,
          radius: radius),
    );

    if (result is Success<SearchRamenPlacesResponse, AppErrorCode>) {
      state = state.copyWith(places: result.value.places, isLoading: false);
      return true;
    } else if (result is Failure<SearchRamenPlacesResponse, AppErrorCode>) {
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
      _errorMessageController.state =
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

  /// お気に入り追加・削除
  Future<bool> toggleFavorite(RamenPlace place) async {
    final placeId = place.id;
    Result<bool, AppErrorCode> dbResult;

    if (state.favoritePlaceIds.contains(placeId)) {
      // 既にお気に入りであれば削除
      dbResult = await _databaseService.removeFavorite(placeId);
    } else {
      // お気に入りでなければ追加
      dbResult = await _databaseService.addFavorite(place);
    }
    if (dbResult is Success<bool, AppErrorCode>) {
      if (dbResult.value) {
        // DB操作が成功した場合、stateを更新
        if (state.favoritePlaceIds.contains(placeId)) {
          state = state.copyWith(
            favoritePlaceIds: Set.from(state.favoritePlaceIds)..remove(placeId),
          );
        } else {
          state = state.copyWith(
            favoritePlaceIds: Set.from(state.favoritePlaceIds)..add(placeId),
          );
        }
        return true;
      } else {
        // DB操作自体は成功したが、変更がなかった場合（例えば削除対象が見つからなかった場合など）
        _errorMessageController.state = AppErrorCode.databaseUnknownError();
        return false;
      }
    } else if (dbResult is Failure<bool, AppErrorCode>) {
      // DB操作が失敗した場合
      _errorMessageController.state = dbResult.exception;
      return false;
    } else {
      // 予期せぬ結果の場合
      _errorMessageController.state = AppErrorCode.commonSystemError();
      return false;
    }
  }

  /// お気に入り店舗一覧をロード
  Future<void> loadFavoriteShops() async {
    final result = await _databaseService.getFavorites();
    if (result is Success<List<RamenPlace>, AppErrorCode>) {
      // 成功した場合
      state = state.copyWith(
          favoritePlaceIds: result.value.map((shop) => shop.id).toSet());
    }
  }
}
