import 'package:ramen_recommendation/models/ramen_place.dart';
import 'package:ramen_recommendation/state/ramen_state.dart';
import 'package:ramen_recommendation/services/database_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../errors/app_error_code.dart';

part 'favorite_places_viewmodel.g.dart';

@riverpod
class FavoritePlacesViewModel extends _$FavoritePlacesViewModel {
  late final DatabaseService _databaseService;

  @override
  RamenState build(DatabaseService databaseService) {
    _databaseService = databaseService;
    return RamenState();
  }

  Future<bool> toggleFavorite(RamenPlace place) async {
    state = state.copyWith(isLoading: true);
    final placeId = place.id;
    bool result = false;
    if (state.favoritePlaceIds.contains(placeId)) {
      result = await _databaseService.removeFavorite(placeId);
      if (result) {
        state = state.copyWith(
          isLoading: false,
          favoritePlaceIds: Set.from(state.favoritePlaceIds)..remove(placeId),
          places: state.places
              .where((place) => place.id != placeId)
              .toList()
        );
      } else {
        state = state.copyWith(isLoading: false);
      }
    } else {
      result = await _databaseService.addFavorite(place);
      if (result) {
        state = state.copyWith(
          favoritePlaceIds: Set.from(state.favoritePlaceIds)..add(placeId),
          places: List.from(state.places)..add(place),
          isLoading: false,
        );
      } else {
        state = state.copyWith(isLoading: false);
      }
    }
    return result;
  }

  Future<bool> loadFavoriteShops() async {
    try {
      state = state.copyWith(isLoading: true);
      final shops = await _databaseService.getFavorites();
      state = state.copyWith(
          favoritePlaceIds: Set.from(shops.map((shop) => shop.id)),
          places: shops,
          isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
          error: AppErrorCode.databaseUnknownError(), isLoading: false);
      return false;
    }
  }
}
