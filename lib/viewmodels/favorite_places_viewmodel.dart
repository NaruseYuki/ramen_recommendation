import 'package:ramen_recommendation/errors/app_error_code.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ramen_recommendation/models/ramen_state.dart';
import 'package:ramen_recommendation/models/ramen_place.dart';
import 'package:ramen_recommendation/services/database_service.dart';
import 'package:ramen_recommendation/api/providers/service_providers.dart';

part 'favorite_places_viewmodel.g.dart';

@riverpod
class FavoritePlacesViewModel extends _$FavoritePlacesViewModel {
  late final DatabaseService _databaseService;

  @override
  RamenState build() {
    _databaseService = ref.watch(databaseServiceProvider);
    return RamenState();
  }

  /// お気に入り店舗一覧をロード
  Future<void> loadFavoriteShops() async {
    state = state.copyWith(isLoading: true);
    try {
      final shops = await _databaseService.getFavorites();
      state = state.copyWith(
        isLoading: false,
        favoritePlaceIds: shops.map((shop) => shop.id).toSet(),
        places: shops,
      );
    } catch (e) {
      state = state.copyWith(
          isLoading: false, error: e as AppErrorCode);
    }
  }

  /// お気に入り追加・削除
  Future<void> toggleFavorite(RamenPlace place) async {
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
              .where((p) => (p as RamenPlace).id != placeId)
              .toList(),
        );
      }
    } else {
      result = await _databaseService.addFavorite(place);
      if (result) {
        state = state.copyWith(
          isLoading: false,
          favoritePlaceIds: Set.from(state.favoritePlaceIds)..add(placeId),
          places: [...state.places, place],
        );
      }
    }
  }
}
