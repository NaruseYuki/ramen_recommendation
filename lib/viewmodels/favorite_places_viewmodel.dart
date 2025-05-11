import 'package:ramen_recommendation/models/ramen_place.dart';
import 'package:ramen_recommendation/models/ramen_state.dart';
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

  void toggleFavorite(RamenPlace place) {
    final placeId = place.id;
    if (state.favoritePlaceIds.contains(placeId)) {
      _databaseService.removeFavorite(placeId);
      state = state.copyWith(
        favoritePlaceIds: Set.from(state.favoritePlaceIds)..remove(placeId),
      );
    } else {
      _databaseService.addFavorite(place);
      state = state.copyWith(
        favoritePlaceIds: Set.from(state.favoritePlaceIds)..add(placeId),
      );
    }
  }

  Future<void> loadFavoriteShops() async {
    try {
      final shops = await _databaseService.getFavorites();
      state = state.copyWith(
        favoritePlaceIds: Set.from(shops.map((shop) => shop.id)),
      );
    } catch (e) {
      throw AppErrorCode.databaseUnknownError();
    }
  }
}
