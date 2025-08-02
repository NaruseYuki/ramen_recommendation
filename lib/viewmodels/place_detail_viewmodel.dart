// lib/viewmodels/place_detail_viewmodel.dart
import 'package:flutter_riverpod/flutter_riverpod.dart'; // StateControllerをインポートするために必要
import 'package:ramen_recommendation/api/providers/service_providers.dart';
import 'package:ramen_recommendation/api/requests/get_place_details_request.dart';
import 'package:ramen_recommendation/models/ramen_place.dart';
import 'package:ramen_recommendation/models/ramen_state.dart';
import 'package:ramen_recommendation/repositories/implements/database_repository.dart';
import 'package:ramen_recommendation/repositories/interfaces/places_repository_interface.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../api/responses/get_place_details_response.dart';
import '../errors/app_error_code.dart';
import '../repositories/result.dart';

part 'place_detail_viewmodel.g.dart';

@riverpod
class PlaceDetailViewModel extends _$PlaceDetailViewModel {
  late final DatabaseService _databaseService;
  late final PlacesRepositoryInterface _placesRepository;
  late final StateController<AppErrorCode?> _errorMessageController;

  @override
  RamenState build() {
    _databaseService = ref.watch(databaseServiceProvider);
    _placesRepository = ref.watch(placeDetailsRepositoryProvider);
    _errorMessageController = ref.read(errorMessageProvider.notifier);
    return RamenState();
  }

  Future<bool> toggleFavorite(RamenPlace place) async {
    final placeId = place.id;
    Result<bool, AppErrorCode> dbResult;

    if (state.favoritePlaceIds.contains(placeId)) {
      dbResult = await _databaseService.removeFavorite(placeId);
    } else {
      dbResult = await _databaseService.addFavorite(place);
    }

    if (dbResult is Success<bool, AppErrorCode>) {
      if (dbResult.value) {
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
        _errorMessageController.state = AppErrorCode.databaseUnknownError();
        return false;
      }
    } else if (dbResult is Failure<bool, AppErrorCode>) {
      _errorMessageController.state = dbResult.exception;
      return false;
    } else {
      _errorMessageController.state = AppErrorCode.commonSystemError();
      return false;
    }
  }

  fetchInitialData(String placeId) async {
    state = state.copyWith(isLoading: true);
    // 初期データのロード処理をここに追加
    await loadFavoritePlacesWithoutLoading();
    await fetchPlaceDetailsWithoutLoading(placeId);
    state = state.copyWith(isLoading: false);
  }

  Future<void> fetchPlaceDetails(String placeId) async {
    state = state.copyWith(isLoading: true);
    final result = await _placesRepository.getPlaceDetails(
      request: GetPlaceDetailsRequest(placeId: placeId),
    );

    if (result is Success<GetPlaceDetailsResponse, AppErrorCode>) {
      state = state.copyWith(
        isLoading: false,
        detail: {placeId: result.value},
      );
    } else if (result is Failure<GetPlaceDetailsResponse, AppErrorCode>) {
      _errorMessageController.state = result.exception;
      state = state.copyWith(isLoading: false);
    } else {
      _errorMessageController.state = AppErrorCode.commonSystemError();
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> fetchPlaceDetailsWithoutLoading(String placeId) async {
    final result = await _placesRepository.getPlaceDetails(
      request: GetPlaceDetailsRequest(placeId: placeId),
    );

    if (result is Success<GetPlaceDetailsResponse, AppErrorCode>) {
      state = state.copyWith(
        detail: {placeId: result.value},
      );
    } else if (result is Failure<GetPlaceDetailsResponse, AppErrorCode>) {
      _errorMessageController.state = result.exception;
    } else {
      _errorMessageController.state = AppErrorCode.commonSystemError();
    }
  }

  Future<void> loadFavoritePlaces() async {
    state = state.copyWith(isLoading: true);
    final result = await _databaseService.getFavorites();

    if (result is Success<List<RamenPlace>, AppErrorCode>) {
      state = state.copyWith(
        isLoading: false,
        favoritePlaceIds: result.value.map((place) => place.id).toSet(),
      );
    } else if (result is Failure<List<RamenPlace>, AppErrorCode>) {
      _errorMessageController.state = result.exception;
      state = state.copyWith(isLoading: false);
    } else {
      _errorMessageController.state = AppErrorCode.commonSystemError();
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> loadFavoritePlacesWithoutLoading() async {
    final result = await _databaseService.getFavorites();
    if (result is Success<List<RamenPlace>, AppErrorCode>) {
      state = state.copyWith(
        favoritePlaceIds: result.value.map((place) => place.id).toSet(),
      );
    } else if (result is Failure<List<RamenPlace>, AppErrorCode>) {
      _errorMessageController.state = result.exception;
    } else {
      _errorMessageController.state = AppErrorCode.commonSystemError();
    }
  }
}
