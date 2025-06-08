import 'package:ramen_recommendation/api/requests/get_place_details_request.dart';
import 'package:ramen_recommendation/models/ramen_place.dart';
import 'package:ramen_recommendation/repositories/interfaces/places_repository_interface.dart';
import 'package:ramen_recommendation/services/database_service.dart';
import 'package:ramen_recommendation/models/ramen_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ramen_recommendation/api/providers/service_providers.dart';
import '../errors/app_error_code.dart';

part 'place_detail_viewmodel.g.dart';

@riverpod
class PlaceDetailViewModel extends _$PlaceDetailViewModel {
  late final DatabaseService _databaseService;
  late final PlacesRepositoryInterface _placesRepository;

  @override
  RamenState build() {
    _databaseService = ref.watch(databaseServiceProvider);
    _placesRepository = ref.watch(placeDetailsRepositoryProvider);
    return RamenState();
  }

  Future<bool> toggleFavorite(RamenPlace place) async {
    final placeId = place.id;
    bool result = false;
    if (state.favoritePlaceIds.contains(placeId)) {
      result = await _databaseService.removeFavorite(placeId);
      if (result) {
        state = state.copyWith(
          favoritePlaceIds: Set.from(state.favoritePlaceIds)..remove(placeId),
        );
      }
    } else {
      result = await _databaseService.addFavorite(place);
      if (result) {
        state = state.copyWith(
          favoritePlaceIds: Set.from(state.favoritePlaceIds)..add(placeId),
        );
      }
    }
    if (!result) {
      state = state.copyWith(error: AppErrorCode.databaseUnknownError());
    }
    return result;
  }

  Future<void> fetchPlaceDetails(String placeId) async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await _placesRepository.getPlaceDetails(
        request: GetPlaceDetailsRequest(placeId: placeId),
      );
      state = state.copyWith(
        isLoading: false,
        detail: {placeId: response},
      );
    } catch (e) {
      state = state.copyWith(
          error: e as AppErrorCode, isLoading: false);
    }
  }
}
