import 'package:ramen_recommendation/api/requests/get_place_details_request.dart';
import 'package:ramen_recommendation/api/responses/get_place_details_response.dart';
import 'package:ramen_recommendation/errors/app_error_code.dart';
import 'package:ramen_recommendation/repositories/interfaces/places_repository_interface.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ramen_recommendation/models/ramen_state.dart';
import 'package:ramen_recommendation/models/ramen_place.dart';
import 'package:ramen_recommendation/services/database_service.dart';
import 'package:ramen_recommendation/api/providers/service_providers.dart';

part 'favorite_places_viewmodel.g.dart';

@riverpod
class FavoritePlacesViewModel extends _$FavoritePlacesViewModel {
  late final DatabaseService _databaseService;
  late final PlacesRepositoryInterface _placeDetailsRepository;

  @override
  RamenState build() {
    _databaseService = ref.watch(databaseServiceProvider);
    _placeDetailsRepository = ref.watch(placeDetailsRepositoryProvider);
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
          isLoading: false, error: AppErrorCode.databaseUnknownError());
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
    if (!result) {
      state = state.copyWith(
          isLoading: false, error: AppErrorCode.databaseUnknownError());
    }
  }

  /// 店舗詳細を取得
  /// Place Details API を呼び出す
  Future<GetPlaceDetailsResponse?> fetchPlaceDetails(String placeId) async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await _placeDetailsRepository.getPlaceDetails(
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
